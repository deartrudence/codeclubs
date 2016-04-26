require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    build(:user).should be_valid
  end

  it "validates if admin" do
    user = create(:user)
    profile = create(:profile, user: user)
    expect(user.admin?).to eq(true)
  end
end
