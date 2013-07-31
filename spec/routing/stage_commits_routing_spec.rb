require "spec_helper"

describe StageCommitsController do
  describe "routing" do

    it "routes to #index" do
      get("/stage_commits").should route_to("stage_commits#index")
    end

    it "routes to #new" do
      get("/stage_commits/new").should route_to("stage_commits#new")
    end

    it "routes to #show" do
      get("/stage_commits/1").should route_to("stage_commits#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stage_commits/1/edit").should route_to("stage_commits#edit", :id => "1")
    end

    it "routes to #create" do
      post("/stage_commits").should route_to("stage_commits#create")
    end

    it "routes to #update" do
      put("/stage_commits/1").should route_to("stage_commits#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/stage_commits/1").should route_to("stage_commits#destroy", :id => "1")
    end

  end
end
