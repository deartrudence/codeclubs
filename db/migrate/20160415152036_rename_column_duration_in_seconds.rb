class RenameColumnDurationInSeconds < ActiveRecord::Migration
  def change
    rename_column :lessons, :duration_in_seconds, :duration_in_minutes
  end
end
