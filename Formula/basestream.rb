class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url ""
      sha256 "0da9b0b27bd38830df06f4092513df4715849f20b1a31039dda8d0a8d118966e"
    else
      url ""
      sha256 "856eb3b242e02028a70d0e18e5e24528d0ef3646f3d254ba0c129d97b2d21ba8"
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
