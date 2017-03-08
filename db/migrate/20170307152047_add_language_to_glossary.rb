class AddLanguageToGlossary < ActiveRecord::Migration
  def change
    add_column :glossaries, :language, :string, :default => 'en'
  end
end
