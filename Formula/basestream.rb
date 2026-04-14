class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-arm64.tar-gjtiklxBgrEqAfFeoIuRGlw1tSOoJ4.gz"
      sha256 "df51da1fadd60d8362441f36340d2bf4ec0c97cae0bb063059652e06871daeab"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-x64.tar-k0pQPxgf9QMOOClbaIbxNyTuCeeZCS.gz"
      sha256 "21fcafd4e19244a189281d75dc341a3e43304b8451eb3a24018e11afd932c024"
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
