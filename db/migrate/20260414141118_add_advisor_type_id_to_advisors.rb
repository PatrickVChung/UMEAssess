class AddAdvisorTypeIdToAdvisors < ActiveRecord::Migration[8.0]
  def change
    add_column :advisors, :advisor_type_id, :integer
    add_index :advisors, :advisor_type_id
  end
end
