class AddProvinceToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :province, :string
  end
end
