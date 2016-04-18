require 'rails_helper'

RSpec.describe "mailing_lists/index", type: :view do
  before(:each) do
    assign(:mailing_lists, [
      MailingList.create!(
        :name => "Name",
        :email => "Email",
        :opt_in => false
      ),
      MailingList.create!(
        :name => "Name",
        :email => "Email",
        :opt_in => false
      )
    ])
  end

  it "renders a list of mailing_lists" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
