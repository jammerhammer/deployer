GitConfig = YAML.load_file("#{Rails.root}/config/gitconfig.yml")[Rails.env]
