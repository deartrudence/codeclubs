class AddDefaultValueToLevel < ActiveRecord::Migration
  def up
    change_column :lessons, :level, :integer, :default => 1
  end

  def down
    change_column :lessons, :level, :integer, :default => nil
  end
end
