require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :school => "MyString",
      :role => "MyString",
      :grade => "MyString",
      :mailing_list => false
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input#profile_first_name[name=?]", "profile[first_name]"

      assert_select "input#profile_last_name[name=?]", "profile[last_name]"

      assert_select "input#profile_school[name=?]", "profile[school]"

      assert_select "input#profile_role[name=?]", "profile[role]"

      assert_select "input#profile_grade[name=?]", "profile[grade]"

      assert_select "input#profile_mailing_list[name=?]", "profile[mailing_list]"
    end
  end
end
