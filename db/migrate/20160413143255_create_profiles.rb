class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :school
      t.string :role
      t.string :grade
      t.boolean :mailing_list

      t.timestamps null: false
    end
  end
end
