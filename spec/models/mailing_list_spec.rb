require 'rails_helper'

RSpec.describe MailingList, type: :model do
  it "has a valid factory" do
    build(:mailing_list).should be_valid
  end

  it "is searchable on name" do
    mail = create(:mailing_list)
    mail2 = create(:mailing_list, name: 'Anne')
    mails = MailingList.all
    expect(mails.search('Jordan')).to include mail
  end

  it "is searchable on email" do
    mail = create(:mailing_list)
    mail2 = create(:mailing_list, email: 'hello@email.com')
    mails = MailingList.all
    expect(mails.search('hello@email.com')).to include mail2
  end
end
