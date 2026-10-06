cask "kyo" do
  arch arm: "aarch64"

  version "0.8.0"
  sha256 arm:   "2ccb83b6b414dbe13d509a45a6114fbdd6318d51b4b7ec1f9d261e78fe425ff3"

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
