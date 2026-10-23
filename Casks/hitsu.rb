cask "hitsu" do
  arch arm: "aarch64"

  version "0.9.1"
  sha256 arm:   "1a5ac996ed1c010a0ad6c76c2d6e95efa8aff054dddd324bca66cb4831784eb8"

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
