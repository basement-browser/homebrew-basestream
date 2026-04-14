class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-arm64.tar-ndu1sVGsWJszfgIbmQ5gelUHHnf3MD.gz"
      sha256 "1a1d37bdb0c0e19408528a4734c0cea7ff10c2f43ad76c8854f500f730b3686a"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-x64.tar-eBWNNaTZVniGUKQaHisYC5XE4cgxow.gz"
      sha256 "10e7b1bfa6f60e362ad9f32645e57b97a5f98e67346e65f8b0f4e777c2f74afb"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "basestream-darwin-arm64" => "basestream"
    else
      bin.install "basestream-darwin-x64" => "basestream"
    end
    system "codesign", "-s", "-", "-f", bin/"basestream"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/basestream --version")
  end
end
