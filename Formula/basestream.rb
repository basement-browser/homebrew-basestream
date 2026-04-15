class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-arm64.tar-LcNi1GbLcCglFgs2RtOmDqvTVDkryF.gz"
      sha256 "e415643c48e5295e3fa21bcb2faf1a5314c56f1429784f2fec047a5ff59a565a"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-x64.tar-H4FoXn4mXuIc72cGdGSLn1s05Ffnz1.gz"
      sha256 "eebe6067f6066d48bd15bc8bacc0daffce342976ec0c858214cf6cca379ee22b"
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
