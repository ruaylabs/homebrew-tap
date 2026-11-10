cask "melocoton" do
  version "0.36.0"
  sha256 "753e74e4a4b91e6cbb013bcbdfc1101af76e809756dbfe3ef926f037c1cf34a5"

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
