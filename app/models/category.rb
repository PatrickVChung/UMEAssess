# app/models/category.rb
# app/models/category.rb
class Category < ApplicationRecord
  has_many :sub_categories, dependent: :destroy, inverse_of: :category

  # allows creating sub-categories via the category form
  accepts_nested_attributes_for :sub_categories,
                                reject_if: :all_blank,
                                allow_destroy: true

  validates :name, presence: true
end
