class AddFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :province, :string
    add_column :profiles, :gender, :string
    add_column :profiles, :years_of_experience, :integer
    add_column :profiles, :teaching_role, :string
  end
end
