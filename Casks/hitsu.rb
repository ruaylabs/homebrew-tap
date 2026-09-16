cask "hitsu" do
  arch arm: "aarch64"

  version "0.7.0"
  sha256 arm:   "36590c21d96be2df4ff991c4f566fd529b97fc74fa3d2c1a3e7710c83451f875"

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
