require 'rails_helper'

RSpec.describe "LessonDashboards", type: :request do
  describe "GET /lesson_dashboards" do
    it "works! (now write some real specs)" do
      get lesson_dashboards_path
      expect(response).to have_http_status(200)
    end
  end
end
