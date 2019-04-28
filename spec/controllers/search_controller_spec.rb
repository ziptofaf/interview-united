require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  before(:each) do
    FactoryBot.create(:category, name: 'Root')
  end
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #filtered" do
    it "returns http success" do
      get :filtered
      expect(response).to have_http_status(:success)
    end
  end

end
