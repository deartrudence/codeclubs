class AddFeatureImageToLesson < ActiveRecord::Migration
  def up
      add_attachment :lessons, :feature_image
    end

    def down
      remove_attachment :lessons, :feature_image
    end
end
