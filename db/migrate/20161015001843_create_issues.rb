class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.string :dept_status
      t.string :student_status
      t.string :status
      t.integer :bounce_counter

      t.timestamps
    end
  end
end
