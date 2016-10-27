class AddNumberofStudentsandAgeRangetoProfile < ActiveRecord::Migration
  def change
  	add_column :profiles, :number_of_students, :integer
  	add_column :profiles, :learner_age_range, :string
  end
end
