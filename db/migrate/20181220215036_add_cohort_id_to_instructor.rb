class AddCohortIdToInstructor < ActiveRecord::Migration[5.2]
  def change
    add_column :instructors, :cohort_id, :integer
  end
end
