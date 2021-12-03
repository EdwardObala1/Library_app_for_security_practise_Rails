require "rails_helper"

RSpec.describe WaitinglistsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/waitinglists").to route_to("waitinglists#index")
    end

    it "routes to #new" do
      expect(get: "/waitinglists/new").to route_to("waitinglists#new")
    end

    it "routes to #show" do
      expect(get: "/waitinglists/1").to route_to("waitinglists#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/waitinglists/1/edit").to route_to("waitinglists#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/waitinglists").to route_to("waitinglists#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/waitinglists/1").to route_to("waitinglists#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/waitinglists/1").to route_to("waitinglists#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/waitinglists/1").to route_to("waitinglists#destroy", id: "1")
    end
  end
end
