cask "hop" do
  version "0.2.0"
  sha256 "a8e2a97005f793a9369c77020d017cbb1c340f0c005737dc76985f154dac36cc"

  url "https://github.com/ruaylabs/hop/releases/download/v#{version}/Hop-v#{version}.dmg"
  name "Hop"
  desc "Command palette for configurable multi-step workflows"
  homepage "https://github.com/ruaylabs/hop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :sonoma

  app "Hop.app"

  # Not notarized by Apple — strip quarantine so Gatekeeper doesn't block first launch
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Hop.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Caches/com.ruaylabs.hop",
    "~/Library/Preferences/com.ruaylabs.hop.plist",
  ]
end
