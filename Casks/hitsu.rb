cask "hitsu" do
  arch arm: "aarch64"

  version "0.10.0"
  sha256 arm:   "72a2792cba5b79befb2150f278d1d92627cb57bf9e15b32c8a36dd549998aaba"

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

  zap trash: [
    "~/Library/Application Support/com.ruaylabs.hitsu",
  ]
end
