cask "hitsu" do
  arch arm: "aarch64"

  version "0.13.1"
  sha256 arm:   "6c18d93dec7d2b5c48a07a1057fb3401ce74ae5f6b38f4151f931e0c00b4c92e"

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
