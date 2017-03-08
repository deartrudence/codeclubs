class AddDefaultToLessonsSubmitted < ActiveRecord::Migration
  def change
  	change_column :lessons, :submitted, :boolean, :default => false
  end
end
