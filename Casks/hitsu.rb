cask "hitsu" do
  arch arm: "aarch64"

  version "0.8.0"
  sha256 arm:   "4116d8d307999b4326eeef18736f489170edfcf7dfb348759d6954f28d1cc3e1"

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
