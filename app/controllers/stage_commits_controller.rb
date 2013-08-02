require 'git_hubber'
class StageCommitsController < ApplicationController
  before_action :set_stage_commit, only: [:show, :edit, :update, :destroy]

  # GET /stage_commits
  # GET /stage_commits.json
  def index
    @git_commits = GitHubber.all
    commit_hashes = @git_commits.map { |commit| commit.sha }
    approved_commits = StageCommit.where("sha in (?)",  commit_hashes).map{ |reviews| reviews.sha }
    @git_commits.reject!{|git_commit| approved_commits.include?(git_commit.sha) }
    @stage_commit = StageCommit.new
  end

  def update
  end

  def show
  end
  # POST /stage_commits
  # POST /stage_commits.json
  def create
    @stage_commit = StageCommit.new(stage_commit_params)

    respond_to do |format|
      if @stage_commit.save
        GitHubber.promote_to_prod(@stage_commit.sha)
        old_commits=GitHubber.all_before_hash(@stage_commit.sha)
        logged_commits = StageCommit.where("sha in (?)", old_commits).map{ |reviews| reviews.sha }
        skipped_commits = old_commits - logged_commits

        skipped_commits.each do |skipped_sha|
          StageCommit.create(:sha => skipped_sha, :approver => @stage_commit.approver, :comment => "Auto Approved in Commit #{@stage_commit.sha} and Message #{@stage_commit.comment}")
        end

        format.html { redirect_to @stage_commit, notice: 'Stage commit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stage_commit }
      else
        format.html { render action: 'new' }
        format.json { render json: @stage_commit.errors, status: :unprocessable_entity }
      end
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_stage_commit
    @stage_commit = StageCommit.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def stage_commit_params
    params.require(:stage_commit).permit(:sha,:email, :commit_stamp, :approved, :approver, :comment, :developer)
  end
end
