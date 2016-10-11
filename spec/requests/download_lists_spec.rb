require 'rails_helper'

RSpec.describe "DownloadLists", type: :request do
  describe "GET /download_lists" do
    it "works! (now write some real specs)" do
      get download_lists_path
      expect(response).to have_http_status(200)
    end
  end
end
