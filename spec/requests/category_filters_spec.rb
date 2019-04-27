require 'rails_helper'

RSpec.describe "CategoryFilters", type: :request do
  describe "GET /category_filters" do
    it "works! (now write some real specs)" do
      get category_filters_path
      expect(response).to have_http_status(200)
    end
  end
end
