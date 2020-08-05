class AddInstructorToCourses < ActiveRecord::Migration[6.0]
  def change
    add_reference :courses, :instructor, null: true, foreign_key: true
  end
end
