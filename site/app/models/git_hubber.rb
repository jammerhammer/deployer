module GitHubber

  def self.all()
    client = Octokit::Client.new(:login => GitConfig['login'], :password => GitConfig['password'])
    since = (Date.today-1.week).to_s('%Y-%m-%d')
    commits = client.commits_since(GitConfig['repo_path'],since)
    simple_commit = commits.map do |commit|
      commit.committer.merge( {:sha => commit.sha,
                               :message => commit.commit.message,
                               :avatar => commit.author.avatar_url,
                               :developer => commit.commit.author.name,
                               :email => commit.commit.author.email,
                               :commit_stamp => commit.commit.author.date})
    end
  end

  def self.all_before_hash(commit_hash)
    client = Octokit::Client.new(:login => GitConfig['login'], :password => GitConfig['password'])
    since = (Date.today-1.week).to_s('%Y-%m-%d')
    commits = client.commits_since(GitConfig['repo_path'],since, commit_hash).map{|commit| commit.sha }
  end
  def self.promote_to_prod(commit_hash)
    raise ArgumentError, 'Commit Hash was empty and that will delete production "ouch"' if commit_hash.nil?
    cd = "cd #{GitConfig['local_repo']};"
    `#{cd}git fetch #{GitConfig['repo_ssh_url']}`
    `#{cd}git push  #{GitConfig['repo_ssh_url']} #{commit_hash}:PRODUCTION --f`
  end
end
