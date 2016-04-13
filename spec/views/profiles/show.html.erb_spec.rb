require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :school => "School",
      :role => "Role",
      :grade => "Grade",
      :mailing_list => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/School/)
    expect(rendered).to match(/Role/)
    expect(rendered).to match(/Grade/)
    expect(rendered).to match(/false/)
  end
end
