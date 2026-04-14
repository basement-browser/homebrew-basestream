class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-arm64.tar-W8kTdZbhxurESNaMF9Vwq1tAsmNgmd.gz"
      sha256 "2d27432dfc6b6ccd630e21b596341e9d85047a920ea98a8e8f9331747de216d5"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-x64.tar-xgXvgJ7FKGQYQVhq5gO1J6En0Es0Hp.gz"
      sha256 "f63be9de25f43edab671757cda106b9b3821e534f83251f38d681910dfa7d267"
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
