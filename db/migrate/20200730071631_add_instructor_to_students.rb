class AddInstructorToStudents < ActiveRecord::Migration[6.0]
  def change
    add_reference :students, :instructor, null: false, foreign_key: true
  end
end
