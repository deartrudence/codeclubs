require 'rails_helper'

RSpec.describe "LessonReferences", type: :request do
  describe "GET /lesson_references" do
    it "works! (now write some real specs)" do
      get lesson_references_path
      expect(response).to have_http_status(200)
    end
  end
end
