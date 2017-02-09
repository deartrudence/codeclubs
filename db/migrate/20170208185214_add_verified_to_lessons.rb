class AddVerifiedToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :verified, :boolean, default: false
  end
end
