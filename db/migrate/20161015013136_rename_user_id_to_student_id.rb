class RenameUserIdToStudentId < ActiveRecord::Migration[5.0]
  def change
    rename_column :issues, :user_id, :student_id
  end
end
