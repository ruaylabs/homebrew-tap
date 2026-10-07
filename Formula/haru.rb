class Haru < Formula
  version "0.1.0"
  sha256 "4a67b41d7bd3a0312d71517ca7459128204c4704ac81fb76be245e7deb1639f5"
  license "MIT"

  url "https://github.com/ruaylabs/haru/releases/download/v#{version}/haru-macos-universal"
  desc "Save an image from the clipboard to a file (pngpaste alternative)"
  homepage "https://github.com/ruaylabs/haru"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  def install
    bin.install "haru-macos-universal" => "haru"
  end
end
