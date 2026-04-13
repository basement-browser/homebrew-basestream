class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-arm64.tar-pjNqYOjjzddBpRzIKjfx8HnxJ6lgce.gz"
      sha256 "fb260ee8bf826ee67879098d60f881ed956dc30f643685579027e5a0591612ce"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-x64.tar-UBUC439wP6PxKwlK3Zws697OO9rVcE.gz"
      sha256 "eee770cdaabc7cb02b7de6ce65a885790cd0a9d6529fa97ed148e428eaca082e"
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
