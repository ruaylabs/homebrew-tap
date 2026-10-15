cask "hitsu" do
  arch arm: "aarch64"

  version "0.7.2"
  sha256 arm:   "500da7e792fc3f4261a2a1ace3ea0e45d8d35d81cad8645dd304001909069188"

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
