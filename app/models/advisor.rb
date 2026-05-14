class Advisor < ApplicationRecord
  belongs_to :user, optional: true
  has_many :meetings, class_name: 'Meeting'
  has_many :events
  belongs_to :advisor_type
end
