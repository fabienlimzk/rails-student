class CreateJoinTableInstructorStudent < ActiveRecord::Migration[6.0]
  def change
    create_join_table :instructors, :students do |t|
      # t.index [:instructor_id, :student_id]
      # t.index [:student_id, :instructor_id]
    end
  end
end
