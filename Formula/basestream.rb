class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-arm64.tar-8Yd3ePgwapWNSwK5kZDikeqTZgrQPe.gz"
      sha256 "08bfffd03c1979e2394152a8007fa68fc59d6deab4024b318b834233525e54e5"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-x64.tar-DwPNmbI5W3jqxBU9GMO2eAsImFCVt4.gz"
      sha256 "b5317bdf1f84958b807824dbb38b7f4757e136d056e75f52d8fb6b53d7ad8199"
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
