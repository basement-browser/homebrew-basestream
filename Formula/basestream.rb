class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-arm64.tar-SLQodNtOwF9uLCLGQMZHAhL1bRtcGI.gz"
      sha256 "8e4066f477fcf9341ad40dacf9031109b943c22544fef4f4dd01ad8a4e6c4aa1"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-x64.tar-ajzSIZ5FPFo2Y1Dx3mlFzZtVa6FHGx.gz"
      sha256 "4962a6befaca4e5389cabd575293f7eee61716b42699ac98aae3e86bd2ee275a"
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
