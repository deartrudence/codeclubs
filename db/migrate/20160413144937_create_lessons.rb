class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.integer :duration_in_seconds
      t.integer :level
      t.text :description
      t.text :curriculum_concepts
      t.text :prep
      t.text :programming_concepts
      t.text :content
      t.text :extensions
      t.text :answers
      t.string :video_link
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
