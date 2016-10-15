class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :department_id, :integer
    add_column :users, :type, :string
  end
end
