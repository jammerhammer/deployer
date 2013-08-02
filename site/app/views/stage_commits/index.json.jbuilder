json.array!(@stage_commits) do |stage_commit|
  json.extract! stage_commit, :sha, :developer, :email, :commit_stamp, :approved, :approver, :comment
  json.url stage_commit_url(stage_commit, format: :json)
end
