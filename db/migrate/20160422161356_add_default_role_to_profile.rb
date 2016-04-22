class AddDefaultRoleToProfile < ActiveRecord::Migration
  def change
    change_column :profiles, :role, :string, default: "teacher"
  end
end
