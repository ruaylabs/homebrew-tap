cask "hitsu" do
  arch arm: "aarch64"

  version "0.1.0"
  sha256 arm:   "8b2bef6b7d06ea771b91722de4f6f34b23dece1a6cc53e9f0935f11c025ffca9"

  url "https://github.com/ruaylabs/hitsu/releases/download/v#{version}/Hitsu_#{version}_#{arch}.dmg"
  name "Hitsu"
  desc "Password manager"
  homepage "https://github.com/ruaylabs/hitsu"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :sonoma

  app "Hitsu.app"

  # Not notarized by Apple — strip quarantine so Gatekeeper doesn't block first launch
  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-cr", "#{appdir}/Hitsu.app"],
                    sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.ruaylabs.hitsu",
  ]
end
