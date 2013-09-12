GitConfig = YAML.load(ERB.new(File.read("#{Rails.root}/config/gitconfig.yml")).result)[Rails.env]
