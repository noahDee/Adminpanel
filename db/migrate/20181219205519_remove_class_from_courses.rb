class RemoveClassFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :class, :integer
  end
end
