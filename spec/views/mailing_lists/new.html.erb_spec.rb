require 'rails_helper'

RSpec.describe "mailing_lists/new", type: :view do
  before(:each) do
    assign(:mailing_list, MailingList.new(
      :name => "MyString",
      :email => "MyString",
      :opt_in => false
    ))
  end

  it "renders new mailing_list form" do
    render

    assert_select "form[action=?][method=?]", mailing_lists_path, "post" do

      assert_select "input#mailing_list_name[name=?]", "mailing_list[name]"

      assert_select "input#mailing_list_email[name=?]", "mailing_list[email]"

      assert_select "input#mailing_list_opt_in[name=?]", "mailing_list[opt_in]"
    end
  end
end
