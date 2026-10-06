cask "kyo" do
  arch arm: "aarch64"

  version "0.9.0"
  sha256 arm:   "af7b36be2b079e1b3c95db2cea9d27de551bb8b3ad6e32f89d205203c6c2ea78"

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
