# app/controllers/categories_controller.rb
class CategoriesController < ApplicationController
  before_action :set_category, ONLY: [:edit, :update, :destroy]

  def index
    @categories = Category.all
    @category = Category.new
  end

  def new
    @category = Category.new
    @category.sub_categories.build # Start with one empty slot if desired
  end

  def subcategories
      @category = Category.find(params[:id])

      # Grab the associated subcategories and render them strictly as JSON data
      render json: @category.sub_categories.select(:id, :name)
  end


  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      respond_to do |format|
        format.turbo_stream do
            render turbo_stream: [
              turbo_stream.append("categories_list", partial: "categories/category", locals: { category: @category }),
              turbo_stream.update("new_category_frame", "")
            ]
        end
        format.html { redirect_to categories_path, notice: "Category created!" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@category) }
        format.html { redirect_to categories_path, notice: "Category updated!" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@category) }
      format.html { redirect_to categories_path, notice: "Category deleted!" }
    end
  end

  private

  def set_category
    @category = Category.find(params[:id]) if params[:id].present?
  end

  def category_params
    params.require(:category).permit(
      :name,
      sub_categories_attributes: [:id, :name, :selected, :_destroy]
    )
  end
end
