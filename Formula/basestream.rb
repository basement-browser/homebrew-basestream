class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-arm64.tar-C6VP2Ta6hwmiHlepNcc302X9QyZYpl.gz"
      sha256 "dc028fd410d664051b8e32bd5875b6b73336287ca2f1831b71a1943c23ae1ada"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-x64.tar-ijtbP0VYJCiEMYja6Mxb8pW8t97q3x.gz"
      sha256 "c8db2ff078432736d5bbdc9162509ce9d3a7849c12bc425342cac344a47ee5f2"
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
