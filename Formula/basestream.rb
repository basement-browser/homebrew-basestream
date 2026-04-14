class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-arm64.tar-Z75h3IoZEtz2RB6Oe3WhXFzTgXkNSS.gz"
      sha256 "f64e9eb3084b00e1b76e75697dcf37570496e317bf40a0043741756ff9a21d1a"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-x64.tar-NAiL4IDt07pc3KoYMrBsl5L2sNXEaA.gz"
      sha256 "a651ad0db3593384104dedf9c7942bd6b7ec82877e2c5b9e66c754e3beb370f4"
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
