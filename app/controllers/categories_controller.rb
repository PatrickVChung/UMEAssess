class CategoriesController < ApplicationController
  def subcategories
    category = Category.find(params[:category_id])
    render json: category.sub_categories.select(:id, :name)
  end

  def index
      @categories = Category.includes(:sub_categories).all
  end

  def update_all
    # Logic to handle bulk checkbox updates
    if params[:sub_category_ids].present?
      # Example: Reset all and set selected
      SubCategory.update_all(selected: false)
      SubCategory.where(id: params[:sub_category_ids]).update_all(selected: true)
    end

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to categories_path, notice: "Saved successfully!" }
    end
  end
  def new
      @category = Category.new
      @category.sub_categories.build # Start with one blank sub-category input
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            # Append the new category to the list
            turbo_stream.append("categories_list", render(@category)),
            # Clear the "New Category" form frame
            turbo_stream.update("new_category_row", "")
          ]
        end
        format.html { redirect_to categories_path }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end
  private

    def category_params
      params.require(:category).permit(:name, sub_categories_attributes: [:id, :name, :_destroy])
    end
end
