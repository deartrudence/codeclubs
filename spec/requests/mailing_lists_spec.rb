require 'rails_helper'

RSpec.describe "MailingLists", type: :request do
  describe "GET /mailing_lists" do
    it "works! (now write some real specs)" do
      get mailing_lists_path
      expect(response).to have_http_status(200)
    end
  end
end
