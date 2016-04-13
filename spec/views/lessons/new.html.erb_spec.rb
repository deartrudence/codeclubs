require 'rails_helper'

RSpec.describe "lessons/new", type: :view do
  before(:each) do
    assign(:lesson, Lesson.new(
      :title => "MyString",
      :duration_in_seconds => 1,
      :level => 1,
      :description => "MyText",
      :curriculum_concepts => "MyText",
      :prep => "MyText",
      :programming_concepts => "MyText",
      :content => "MyText",
      :extensions => "MyText",
      :answers => "MyText",
      :video_link => "MyString",
      :profile => nil
    ))
  end

  it "renders new lesson form" do
    render

    assert_select "form[action=?][method=?]", lessons_path, "post" do

      assert_select "input#lesson_title[name=?]", "lesson[title]"

      assert_select "input#lesson_duration_in_seconds[name=?]", "lesson[duration_in_seconds]"

      assert_select "input#lesson_level[name=?]", "lesson[level]"

      assert_select "textarea#lesson_description[name=?]", "lesson[description]"

      assert_select "textarea#lesson_curriculum_concepts[name=?]", "lesson[curriculum_concepts]"

      assert_select "textarea#lesson_prep[name=?]", "lesson[prep]"

      assert_select "textarea#lesson_programming_concepts[name=?]", "lesson[programming_concepts]"

      assert_select "textarea#lesson_content[name=?]", "lesson[content]"

      assert_select "textarea#lesson_extensions[name=?]", "lesson[extensions]"

      assert_select "textarea#lesson_answers[name=?]", "lesson[answers]"

      assert_select "input#lesson_video_link[name=?]", "lesson[video_link]"

      assert_select "input#lesson_profile_id[name=?]", "lesson[profile_id]"
    end
  end
end
