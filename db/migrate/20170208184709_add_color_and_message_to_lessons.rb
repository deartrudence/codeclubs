class AddColorAndMessageToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :custom_color, :string
    add_column :lessons, :verification_message, :string
  end
end
