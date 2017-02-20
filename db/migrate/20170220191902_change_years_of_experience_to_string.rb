class ChangeYearsOfExperienceToString < ActiveRecord::Migration
  def self.up
     change_table :profiles do |t|
       t.change :years_of_experience, :string
     end
   end
   def self.down
     change_table :profiles do |t|
       t.change :years_of_experience, :integer
     end
   end
end
