class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-arm64.tar-LKBcuSz1nGwkyCCkWrz1gF88k2ARPz.gz"
      sha256 "b32420a607bd02947fdde5bc6a48ae7ce36a5a69c68c628aa9eadcae0f44ec8a"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-x64.tar-J0j95o6FF5zlERVAJEMVgklPdZjpz0.gz"
      sha256 "d1f98a74550d367bfd32a83b0faf2d0d47654509b5ae9a8dc90b2d95d20c13e9"
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
