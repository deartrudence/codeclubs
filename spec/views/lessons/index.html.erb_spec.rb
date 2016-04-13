require 'rails_helper'

RSpec.describe "lessons/index", type: :view do
  before(:each) do
    assign(:lessons, [
      Lesson.create!(
        :title => "Title",
        :duration_in_seconds => 1,
        :level => 2,
        :description => "MyText",
        :curriculum_concepts => "MyText",
        :prep => "MyText",
        :programming_concepts => "MyText",
        :content => "MyText",
        :extensions => "MyText",
        :answers => "MyText",
        :video_link => "Video Link",
        :profile => nil
      ),
      Lesson.create!(
        :title => "Title",
        :duration_in_seconds => 1,
        :level => 2,
        :description => "MyText",
        :curriculum_concepts => "MyText",
        :prep => "MyText",
        :programming_concepts => "MyText",
        :content => "MyText",
        :extensions => "MyText",
        :answers => "MyText",
        :video_link => "Video Link",
        :profile => nil
      )
    ])
  end

  it "renders a list of lessons" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Video Link".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
