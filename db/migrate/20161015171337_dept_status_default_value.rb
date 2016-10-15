class DeptStatusDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column :issues, :dept_status, :string, :default => "Pending"
  end
end
