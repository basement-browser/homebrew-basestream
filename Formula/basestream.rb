class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-arm64.tar-IZq5VPai0P0wbqa8WtNiI4HcpOMAHu.gz"
      sha256 "68061682a078ef46c3c1a044013ff1f87ed54543d62d694dc73c0713eec76989"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-x64.tar-Bw8guWOr2EKl6Sd6td4OuhQMh2Hhgy.gz"
      sha256 "9208499d9cb6f8f305ddc1d55f3f8f501718b8f25176d00b3bbf9798787f83f4"
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
