require 'rails_helper'

RSpec.describe Profile, type: :model do
  it "has a valid factory" do
    build(:profile).should be_valid
  end

  it "should have a user" do
    profile = Profile.new(user: nil)
    expect(profile.valid?).to eq (false)
  end

  it "verifies if admin" do
    profile = create(:profile, role: 'admin')
    expect(profile.is_admin?).to eq(true)
  end

  it "has name" do
    profile = create(:profile, first_name: 'Anne', last_name: 'Smith')
    expect(profile.name).to eq('Anne Smith')
  end

  it "is searchable on last name" do
    user_one = create(:user, email: 'hello@internet.com', password: 'password')
    user_two = create(:user, email: 'hi@email.com', password: 'password')
    profile = create(:profile, user: user_one)
    profile2 = create(:profile, user: user_two, first_name: 'Sam', last_name: 'Barr')
    profiles = Profile.all
    expect(profiles.search('Barr')).to include profile2
  end

  it "is searchable on first name" do
    user_one = create(:user, email: 'hello@internet.com', password: 'password')
    user_two = create(:user, email: 'hi@email.com', password: 'password')
    profile = create(:profile, user: user_one)
    profile2 = create(:profile, user: user_two, first_name: 'Sam', last_name: 'Barr')
    profiles = Profile.all
    expect(profiles.search('Sam')).to include profile2
  end
end
