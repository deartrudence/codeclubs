class CreateSuggestedLessons < ActiveRecord::Migration
  def change
    create_table :suggested_lessons do |t|
      t.references :lesson, index: true, foreign_key: true
      t.integer :suggested_lesson_id

      t.timestamps null: false
    end
  end
end
