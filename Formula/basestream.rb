class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.4.3/basestream-darwin-arm64.tar-6WRBEyz8h4awgqlc912nHhGHlG3Gp2.gz"
      sha256 "bbf1f0e949644b222fef484330faf03eaee9de49af2bdaf68f0fdb5e2abf3675"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.4.3/basestream-darwin-x64.tar-9P5QecYLnw4wBh2N7uH1x4tW9RF2ex.gz"
      sha256 "06e38ab1172490c6dbc57f3bbad594e01d8ebe50dcf7a6491ce2bcde28586c66"
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
