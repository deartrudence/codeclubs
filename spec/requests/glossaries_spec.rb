require 'rails_helper'

RSpec.describe "Glossaries", type: :request do
  describe "GET /glossaries" do
    it "works! (now write some real specs)" do
      get glossaries_path
      expect(response).to have_http_status(200)
    end
  end
end
