require 'spec_helper'

describe "stage_commits/index" do
  before(:each) do
    assign(:stage_commits, [
      stub_model(StageCommit,
        :sha => "Sha",
        :developer => "Developer",
        :email => "Email",
        :commit_stamp => "Commit Stamp",
        :approved => false,
        :approver => "Approver",
        :comment => "MyText"
      ),
      stub_model(StageCommit,
        :sha => "Sha",
        :developer => "Developer",
        :email => "Email",
        :commit_stamp => "Commit Stamp",
        :approved => false,
        :approver => "Approver",
        :comment => "MyText"
      )
    ])
  end

  it "renders a list of stage_commits" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sha".to_s, :count => 2
    assert_select "tr>td", :text => "Developer".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Commit Stamp".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Approver".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
