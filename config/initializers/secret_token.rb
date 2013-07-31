# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Deployer::Application.config.secret_key_base = '1551dc5a1fb400c1f02add1a5880068e58e4e06eeef0b7b63818e625e36fbafe8cd1f5557756ad37da3f70f2e83fe00dcd4d4af18275a3c7049b2d7418ef5762'
