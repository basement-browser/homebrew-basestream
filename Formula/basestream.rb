class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/basement-browser/basement-mono/releases/download/basestream-v0.4.1/basestream-darwin-arm64.tar.gz"
      sha256 "2f4e217b22b614ba34e001a0cce785b3d273b5ca4fe680b8cfaa8b8178cebc5c"
    else
      url "https://github.com/basement-browser/basement-mono/releases/download/basestream-v0.4.1/basestream-darwin-x64.tar.gz"
      sha256 "e5a3f5ea2ed9b5382bd9c131107de1313dd220a9401310dc33f59566983a10cf"
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
