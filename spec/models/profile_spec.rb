require 'rails_helper'

RSpec.describe Profile, type: :model do
  it "has a valid factory" do
    build(:profile).should be_valid
  end
end
