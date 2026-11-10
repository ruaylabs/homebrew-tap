cask "melocoton" do
  version "0.36.1"
  sha256 "6341af1c7e5997add1fcac22aee63bbf59f46f772a409485844c21b69fd522ba"

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
