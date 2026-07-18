cask "melocoton" do
  version "0.30.0"
  sha256 "d05aa6fa7eac8f4163ac9ceb612399bbcc6f138eaac8cafb68513f1c19d5dd68"

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
  ]
end
