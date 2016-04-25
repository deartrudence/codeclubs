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

  # it "is searchable" do
  #   lesson = build(:lesson)
  #   lessons = Lesson.all
  #   expect(lessons.search('MyString')).to include lesson
  # end
end
