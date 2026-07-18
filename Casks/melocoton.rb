cask "melocoton" do
  version "0.31.0"
  sha256 "26feb0fdd32214091d2f0b7c6a2e8375f47d4e2a9243177f8c44130ad6b5fd1a"

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

  # Not notarized by Apple — strip quarantine so Gatekeeper doesn't block first launch
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Melocoton.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/app.melocoton.app",
    "~/Library/Application Support/com.ruaylabs.melocoton",
  ]
end
