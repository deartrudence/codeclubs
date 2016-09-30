class AddReferencesToLessons < ActiveRecord::Migration
  def change
  	add_column :lessons, :references, :text
  end
end
