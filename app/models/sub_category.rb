
class SubCategory < ApplicationRecord
  belongs_to :category, inverse_of: :sub_categories

    validates :name, presence: true
end
