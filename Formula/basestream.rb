class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-arm64.tar-haUA0TtZN3xZZ7PTROow7wlIOPds97.gz"
      sha256 "b192cef8f06baf2a93594322e61305ae8d8f5f03ec62867e5023e1e21e745167"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-x64.tar-tOQETYU0NOPiI6yFFcxDiybbcasmF4.gz"
      sha256 "b71ebc548f17cb6b740c4703d67e458b03199d1c9697f61047a96d2be2f3b6e6"
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
