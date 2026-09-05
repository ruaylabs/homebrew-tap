cask "hitsu" do
  arch arm: "aarch64"

  version "0.5.0"
  sha256 arm:   "afaf8e15dc4c1ff4c0c2be292608ca25a09bc3349f72bd33b17c5f26b83849c2"

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
