cask "hitsu" do
  arch arm: "aarch64"

  version "0.8.0"
  sha256 arm:   "010c1c79c62f0f29e6c1dbdcf15cf66a11cdb5a653cab32fa60f98bf6b873c81"

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
