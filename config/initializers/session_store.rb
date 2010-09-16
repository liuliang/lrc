# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lrc_session',
  :secret      => '410563e02fc0b0f915f3c9dc566339f3ef3c19dd187d7824d2bffc212c4a49ee9e07bdde72d4a214d08386e5a5fd10321544febeecc80f975c50d60d94b1058d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
