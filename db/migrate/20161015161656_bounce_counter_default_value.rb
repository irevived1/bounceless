class BounceCounterDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column :issues, :bounce_counter, :integer, :default => 0
  end
end
