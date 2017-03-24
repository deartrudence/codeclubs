class AddPdfDownloadNumberToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :pdf_download_count, :integer
  end
end
