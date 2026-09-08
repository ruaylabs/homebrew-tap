cask "kyo" do
  arch arm: "aarch64"

  version "0.7.0"
  sha256 arm:   "9b3c8ab22275059b995d104710e0453ddd00f19b9c50e5c25d4b0d6d78199737"

  url "https://github.com/ruaylabs/kyo/releases/download/v#{version}/kyo_#{version}_#{arch}.dmg"
  name "Kyo"
  desc "Keyboard-driven work tracking app with Backlog, Today, and Upcoming columns"
  homepage "https://github.com/ruaylabs/kyo"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :sonoma

  app "kyo.app"

  zap trash: [
    "~/Library/Application Support/kyo",
  ]
end
