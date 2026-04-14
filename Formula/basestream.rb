class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-arm64.tar-LSqRUzCI6mjJfFdFP3DrWSw8ZTHi4W.gz"
      sha256 "dec2b28060dda148b0a51d3981acb5e37dc5412f3b15c469fe1aafe1331822e5"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-x64.tar-gbdh1th339KLavJhxcJa5jiFNPfbPu.gz"
      sha256 "1cedbacb1ae1ac6726a95d591e8cab65bfd95930f55002bd55f1c33153e71855"
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
