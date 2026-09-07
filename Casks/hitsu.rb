cask "hitsu" do
  arch arm: "aarch64"

  version "0.6.0"
  sha256 arm:   "5c4a8daf79f0c6eae82cb6eef19b264ae5cb10d3d38c874a0b66a4665f5ff7d2"

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
