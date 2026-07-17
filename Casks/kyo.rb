cask "kyo" do
  arch arm: "aarch64"

  version "0.6.1"
  sha256 arm:   "d674e7ac6ddd935d038dc7ce864c0f5d68327b0241b2be1d36a55da7d7eb4f34"

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

  # Not notarized by Apple — strip quarantine so Gatekeeper doesn't block first launch
  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-cr", "#{appdir}/kyo.app"],
                    sudo: false
  end

  zap trash: [
    "~/Library/Application Support/kyo",
  ]
end
