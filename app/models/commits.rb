class GitHubber

  def self.all()
    client = Octokit::Client.new(:login => 'jwoodlee99@gmail.com', :password => 'elocin1')
    commits = client.commits('uslegal/uslegal')[10]
    
    simple_commit = commits.map do |commit|
     commit.committer.values.concat [sha,message,author.avatar_url]
    end
  end


end
