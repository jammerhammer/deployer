require 'git_hubber'
class StageCommitsController < ApplicationController
  before_action :set_stage_commit, only: [:show, :edit, :update, :destroy]

  # GET /stage_commits
  # GET /stage_commits.json
  def index
    @git_commit = GitHubber.all.first

@stage_commit = StageCommit.new
  end

  def update 
  end


  # POST /stage_commits
  # POST /stage_commits.json
  def create
    @stage_commit = StageCommit.new(stage_commit_params)

    respond_to do |format|
      if @stage_commit.save
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
    @bowl = StageCommit.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def stage_commit_params
    params.require(:stage_commit).permit(:developer)
  end


end
