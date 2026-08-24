cask "hitsu" do
  arch arm: "aarch64"

  version "0.4.0"
  sha256 arm:   "b3b999baa6f84b921d1398be46c57bf3e23ee00ec0ac538fba15fa9ebfcdae60"

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
