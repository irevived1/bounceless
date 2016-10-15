class StudentStatusDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column :issues, :student_status, :string, :default => "Pending"
  end
end
