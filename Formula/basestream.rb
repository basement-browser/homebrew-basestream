class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-arm64.tar-rag6pgDCAEz7F18oRk1ScK9q6s98vs.gz"
      sha256 "7065a35c967ec2b7c49e14722f22584ecae6d90d92db6d71e33917bf191da28a"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-x64.tar-wmgaprS3D17ltWcTeZUhvNEeq4P4md.gz"
      sha256 "7c8dcecc96fae73a5004ce54f4e41d024336248cb6dc445589a7781ccf56f68d"
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
