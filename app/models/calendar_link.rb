class CalendarLink < ApplicationRecord
  belongs_to :advisor
  has_rich_text :description
end
