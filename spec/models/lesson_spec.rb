require 'rails_helper'

RSpec.describe Lesson, type: :model do
  it "has a valid factory" do
    build(:lesson).should be_valid
  end
  it "returns a valid short description" do
    lesson = build(:lesson)
    expect(lesson.short_description).to eq("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, ...")
  end

  # it "is valid with title, level, duration_in_minutes, description, and content"
  #   lesson = build(:lesson)
  #
  # end
  it "is invalid without title" do
    lesson = Lesson.new(title: nil)
    lesson.valid?
    expect(lesson.errors[:title]).to include("can't be blank")
  end

  it "is invalid without level" do
    lesson = Lesson.new(level: nil)
    lesson.valid?
    expect(lesson.errors[:level]).to include("can't be blank")
  end
  #
  it "is invalid without duration_in_minutes" do
    lesson = Lesson.new(duration_in_minutes: nil)
    lesson.valid?
    expect(lesson.errors[:duration_in_minutes]).to include("can't be blank")
  end
  #
  it "is invalid without description" do
    lesson = Lesson.new(description: nil)
    lesson.valid?
    expect(lesson.errors[:description]).to include("can't be blank")
  end
  #
  it "is invalid without content" do
    lesson = Lesson.new(content: nil)
    lesson.valid?
    expect(lesson.errors[:content]).to include("can't be blank")
  end

  it "includes lessons that are approved" do
    lesson = create(:lesson, approved: true )
    expect(Lesson.is_approved).to include lesson
  end

  it "is owned by current user " do
    lesson = build(:lesson)
    current_user = lesson.user
    expect(lesson.user_owns_lesson?(current_user)).to eq(true)
  end

  it "is searchable on title" do
    user_one = create(:user, email: 'hello@internet.com', password: 'password')
    user_two = create(:user, email: 'hi@email.com', password: 'password')
    profile_one = create(:profile, user: user_one)
    profile_two = create(:profile, user: user_two)
    lesson1= create(:lesson, title: 'First', profile: profile_one)
    lesson2= create(:lesson, title: 'Second', profile: profile_two)
    lessons = Lesson.all
    expect(lessons.search('Second')).to include lesson2
  end

  # it "is liked by current user" do
  #   @current_user = create(:user)
  #   user = build(:user, email: 'test@test.com', password: 'password')
  #   profile = build(:profile, user: user)
  #   @lesson = build(:lesson, profile: profile)
  #   @lesson.liked_by @current_user
  #   expect(@lesson.liked_by_user(@current_user)).to eq(true)
  # end
end
