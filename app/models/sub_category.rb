
class SubCategory < ApplicationRecord
  belongs_to :category
  # This might store a boolean 'selected' or be linked to a Join Table
end
