class AddGradeAndSubmittedToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :grade, :sting
    add_column :lessons, :submitted, :boolean
  end
end
