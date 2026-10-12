cask "melocoton" do
  version "0.34.1"
  sha256 "af497b18dd4d6da9c8cb69cb745f35496a06ddcbfb1189cc5e336d51a31eb6dd"

  url "https://github.com/ruaylabs/melocoton/releases/download/v#{version}/melocoton-#{version}.dmg"
  name "Melocoton"
  desc "Keyboard-driven database client for SQLite, PostgreSQL, and MySQL"
  homepage "https://github.com/ruaylabs/melocoton"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false

  app "Melocoton.app"

  zap trash: [
    "~/Library/Application Support/app.melocoton.app",
    "~/Library/Application Support/com.ruaylabs.melocoton",
  ]
end
