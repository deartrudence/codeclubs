require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :school => "MyString",
      :role => "MyString",
      :grade => "MyString",
      :mailing_list => false
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input#profile_first_name[name=?]", "profile[first_name]"

      assert_select "input#profile_last_name[name=?]", "profile[last_name]"

      assert_select "input#profile_school[name=?]", "profile[school]"

      assert_select "input#profile_role[name=?]", "profile[role]"

      assert_select "input#profile_grade[name=?]", "profile[grade]"

      assert_select "input#profile_mailing_list[name=?]", "profile[mailing_list]"
    end
  end
end
