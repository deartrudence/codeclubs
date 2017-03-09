class AddDefaultToPdfDownloadForProfile < ActiveRecord::Migration
  def change
    change_column :profiles, :pdf_download_count, :integer, :default => 0
  end
end
