class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-arm64.tar-JwrjXcwEfkB8RHnwxB9rYcOymSIJM1.gz"
      sha256 "6fe15c55c6aebcac2eb5b09f920d44f5f086756d502460df35ffa50eced6e9de"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-x64.tar-MB5AK8hC77ur4XRsKCVNv5hGYqR5Xt.gz"
      sha256 "5c4f7d85090ed61b41cccf9ba41ee3134a58d66f4fc50f0b09316d4afe9f30c6"
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
