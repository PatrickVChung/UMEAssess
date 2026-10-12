class AddUniqueIndexesToCategories < ActiveRecord::Migration[8.0]
  def change
    add_index :categories, :name, unique: true

    add_index :sub_categories,
              [:category_id, :name],
              unique: true
  end
end
