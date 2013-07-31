require 'spec_helper'

describe "stage_commits/edit" do
  before(:each) do
    @stage_commit = assign(:stage_commit, stub_model(StageCommit,
      :sha => "MyString",
      :developer => "MyString",
      :email => "MyString",
      :commit_stamp => "MyString",
      :approved => false,
      :approver => "MyString",
      :comment => "MyText"
    ))
  end

  it "renders the edit stage_commit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stage_commit_path(@stage_commit), "post" do
      assert_select "input#stage_commit_sha[name=?]", "stage_commit[sha]"
      assert_select "input#stage_commit_developer[name=?]", "stage_commit[developer]"
      assert_select "input#stage_commit_email[name=?]", "stage_commit[email]"
      assert_select "input#stage_commit_commit_stamp[name=?]", "stage_commit[commit_stamp]"
      assert_select "input#stage_commit_approved[name=?]", "stage_commit[approved]"
      assert_select "input#stage_commit_approver[name=?]", "stage_commit[approver]"
      assert_select "textarea#stage_commit_comment[name=?]", "stage_commit[comment]"
    end
  end
end
