cask "miru" do
  version "1.0.0"
  sha256 "25c1e41adcee371e5997de33c11c350c05910c2580c86e97e1a567c0f2d8332f"

  url "https://github.com/ruaylabs/miru/releases/download/v#{version}/Miru-v#{version}-macOS.zip"
  name "Miru"
  desc "Quick Look preview extension for Markdown files"
  homepage "https://github.com/ruaylabs/miru"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :monterey

  app "Miru.app"

  postflight do
    system_command "/usr/bin/open",
      args: ["-n", "-g", "-W", "#{appdir}/Miru.app", "--args", "--register-only"]
  end
end
