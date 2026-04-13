class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/basement-browser/basement-mobile/releases/download/basestream-v0.4.1/basestream-darwin-arm64.tar.gz"
      sha256 "fba741d7f701efa04e96722fcb1c10ddb9165a5f011403955eb6798b273bc2b9"
    else
      url "https://github.com/basement-browser/basement-mobile/releases/download/basestream-v0.4.1/basestream-darwin-x64.tar.gz"
      sha256 "842dfbdb7f2f1b354c74c18aa05b6486697141b32e2b005cbe802f413754e6b9"
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
