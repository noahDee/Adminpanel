class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :class_hours
      t.integer :course_id

      t.timestamps
    end
  end
end
