require "rails_helper"

RSpec.describe CategoryFiltersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/category_filters").to route_to("category_filters#index")
    end

    it "routes to #new" do
      expect(:get => "/category_filters/new").to route_to("category_filters#new")
    end

    it "routes to #show" do
      expect(:get => "/category_filters/1").to route_to("category_filters#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/category_filters/1/edit").to route_to("category_filters#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/category_filters").to route_to("category_filters#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/category_filters/1").to route_to("category_filters#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/category_filters/1").to route_to("category_filters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/category_filters/1").to route_to("category_filters#destroy", :id => "1")
    end
  end
end
