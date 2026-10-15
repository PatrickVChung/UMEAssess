class RemoveDescriptionFromCalendarLinks < ActiveRecord::Migration[8.1]
  def change
    remove_column :calendar_links, :description, :string
  end
end
