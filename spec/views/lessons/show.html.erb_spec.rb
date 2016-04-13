require 'rails_helper'

RSpec.describe "lessons/show", type: :view do
  before(:each) do
    @lesson = assign(:lesson, Lesson.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Video Link/)
    expect(rendered).to match(//)
  end
end
