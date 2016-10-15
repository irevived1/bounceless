class AddDeptIdToIssues < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :dept_id, :integer
  end
end
