class RemoveInstructorFromStudents < ActiveRecord::Migration[6.0]
  def change
    remove_reference :students, :instructor, null: false, foreign_key: true
  end
end
