require Rails.root.join("lib/omniauth/strategies/line")

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :discord, ENV["DISCORD_CLIENT_ID"], ENV["DISCORD_CLIENT_SECRET"], scope: "identify email"
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], scope: "openid email profile"
  provider :github, ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_CLIENT_SECRET"], scope: "user:email"
  provider :line, ENV["LINE_CLIENT_ID"], ENV["LINE_CLIENT_SECRET"], scope: "openid email profile"
end
