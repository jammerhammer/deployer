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



  def self.promote_to_prod(commit_hash)
     raise ArgumentError, 'Commit Hash was empty' if commit_hash.nil?
     binding.pry
     `cd ~/code/uslegalforms`
     `git fetch git@github.com:UsLegal/UsLegalForms.git`
     `git push git@github.com:UsLegal/UsLegalForms.git #{commit_hash}:PRODUCTION --f`
   puts "hello nurse"
end
end
