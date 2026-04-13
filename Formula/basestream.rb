class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/basement-browser/basement-mobile/releases/download/basestream-v0.4.0/basestream-darwin-arm64.tar.gz"
      sha256 "1f9fe94beeaa168b7e71a5a042515ae299163bfaa1e4297a2990bc255df7c4cc"
    else
      url "https://github.com/basement-browser/basement-mobile/releases/download/basestream-v0.4.0/basestream-darwin-x64.tar.gz"
      sha256 "7a452d4667f1ab551ef032d304e6c8a2e37de03c2df2f3d03033a4d490b88521"
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
