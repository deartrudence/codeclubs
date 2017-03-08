class CreateLessonReferences < ActiveRecord::Migration
  def change
    create_table :lesson_references do |t|
      t.string :title
      t.string :url
      t.references :lesson, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
