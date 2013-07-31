require 'spec_helper'

describe "stage_commits/show" do
  before(:each) do
    @stage_commit = assign(:stage_commit, stub_model(StageCommit,
      :sha => "Sha",
      :developer => "Developer",
      :email => "Email",
      :commit_stamp => "Commit Stamp",
      :approved => false,
      :approver => "Approver",
      :comment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Sha/)
    rendered.should match(/Developer/)
    rendered.should match(/Email/)
    rendered.should match(/Commit Stamp/)
    rendered.should match(/false/)
    rendered.should match(/Approver/)
    rendered.should match(/MyText/)
  end
end
