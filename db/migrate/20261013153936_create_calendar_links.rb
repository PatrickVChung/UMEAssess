class CreateCalendarLinks < ActiveRecord::Migration[8.1]
  def change
    create_table :calendar_links do |t|
      t.references :advisor, null: false, foreign_key: true
      t.string :title
      t.string :url
      t.string :description

      t.timestamps
    end
  end
end
