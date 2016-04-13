require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :school => "School",
        :role => "Role",
        :grade => "Grade",
        :mailing_list => false
      ),
      Profile.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :school => "School",
        :role => "Role",
        :grade => "Grade",
        :mailing_list => false
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "School".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    assert_select "tr>td", :text => "Grade".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
