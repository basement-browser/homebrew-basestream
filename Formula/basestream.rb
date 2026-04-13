class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.4.2/basestream-darwin-arm64.tar-GrykMx0ceQscAXNZhXaNot0yNM3L3t.gz"
      sha256 "f2c684521673d98a4de8dcdfdd072fca34359977a1f3e570afd39d846805f075"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.4.2/basestream-darwin-x64.tar-eAdMDzrzvU0rA7El5DLQWowjv1uPXx.gz"
      sha256 "e77a550158b508bc31ccd2976f3e1b8600c4ba87f5bec69195d9cc39b8292ab3"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "basestream-darwin-arm64" => "basestream"
    else
      bin.install "basestream-darwin-x64" => "basestream"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/basestream --version")
  end
end
