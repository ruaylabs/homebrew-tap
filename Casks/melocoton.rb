cask "melocoton" do
  version "0.32.0"
  sha256 "f34299f943f60e47833e4cfeff94c93c4efaff498ea01d4a9f3e9cf54bb2ac3f"

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
