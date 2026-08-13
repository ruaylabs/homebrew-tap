cask "hitsu" do
  arch arm: "aarch64"

  version "0.3.0"
  sha256 arm:   "cb79bef0d215a19222fe08c7ddf713e63f1610a76c630e29230e9524d3a493b2"

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
