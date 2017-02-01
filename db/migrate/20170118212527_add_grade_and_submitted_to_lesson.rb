class AddGradeAndSubmittedToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :grade, :string
    add_column :lessons, :submitted, :boolean
  end
end
