module GitHubber

  def self.all()
    client = Octokit::Client.new(:login => 'jwoodlee99@gmail.com', :password => 'elocin1')
    commits = client.commits('uslegal/uslegalforms')
    simple_commit = commits.map do |commit|
     commit.committer.merge( {:sha => commit.sha,
                              :message => commit.commit.message,
                              :avatar => commit.author.avatar_url,
                              :developer => commit.commit.author.name,
                              :email => commit.commit.author.email,
                              :commit_stamp => commit.commit.author.date})
    end

  end
end
