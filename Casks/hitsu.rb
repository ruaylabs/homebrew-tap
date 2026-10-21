cask "hitsu" do
  arch arm: "aarch64"

  version "0.9.0"
  sha256 arm:   "24d8019c237afdd4b7248f9d102c474e2c375c5e648aba5ae59df118f3ef4e49"

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
