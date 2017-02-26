class AddLanguageToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :language, :string, :default => 'en'
  end
end
