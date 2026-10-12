data = YAML.load_file(
  Rails.root.join("db/seeds/categories.yml")
)

data.each do |category_name, subcategories|
  category = Category.find_or_create_by!(name: category_name)

  subcategories.each do |subcategory_name|
    category.sub_categories.find_or_create_by!(
      name: subcategory_name
    )
  end
end
