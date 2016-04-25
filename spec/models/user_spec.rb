require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    build(:user).should be_valid
  end
end
