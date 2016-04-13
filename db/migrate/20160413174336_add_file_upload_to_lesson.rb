class AddFileUploadToLesson < ActiveRecord::Migration
  def up
      add_attachment :lessons, :file_upload
    end

    def down
      remove_attachment :lessons, :file_upload
    end
end
