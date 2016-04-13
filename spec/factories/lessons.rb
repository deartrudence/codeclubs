FactoryGirl.define do
  factory :lesson do
    title "MyString"
    duration_in_seconds 1
    level 1
    description "MyText"
    curriculum_concepts "MyText"
    prep "MyText"
    programming_concepts "MyText"
    content "MyText"
    extensions "MyText"
    answers "MyText"
    video_link "MyString"
    profile nil
  end
end
