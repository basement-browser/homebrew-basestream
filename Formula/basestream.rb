class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/basement-browser/basement-mobile/releases/download/basestream-v0.3.1/basestream-darwin-arm64.tar.gz"
      sha256 "26fd221ae9989d2f36df9403c79849452f3d4c49b678357cd37522c61c38c304"
    else
      url "https://github.com/basement-browser/basement-mobile/releases/download/basestream-v0.3.1/basestream-darwin-x64.tar.gz"
      sha256 "6fd9b4b5f4d34e9a5db0a4696898113b1a01f5e36c9de7b71fbe02ceb47ce98e"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "basestream-darwin-arm64" => "basestream"
    else
      bin.install "basestream-darwin-x64" => "basestream"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/basestream --version")
  end
end
