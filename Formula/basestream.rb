class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-arm64.tar-wXxQE85Ugw4sNjMkTBvT3Rm09CMNq8.gz"
      sha256 "6244bd74d2eb80eb7e6849893288d58f8b05ade9da9562ba9c07ef800e5cc2b2"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-x64.tar-05bzuXTeGrtobjD1ImX8Z2E1RbPx1p.gz"
      sha256 "b06cfdd6799959123b28a2a8dc49316405c8ffdd5afc8d9b8d6c835669a1d71f"
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
