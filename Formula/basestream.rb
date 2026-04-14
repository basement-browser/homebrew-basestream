class Basestream < Formula
  desc "AI work intelligence for teams — automatic work tracking"
  homepage "https://basestream.ai"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-arm64.tar-Ss3uy7PVDXKFNiHZTfovRXWXxlocpm.gz"
      sha256 "cb96e31be5ce47df1cd4dfc0038548a9e94e975b35071ce508f9bae3e5e2f718"
    else
      url "https://90hjjxkaqejv1icr.public.blob.vercel-storage.com/basestream/v0.5.0/basestream-darwin-x64.tar-nlaxPVZxFwehet4peqqpjIdxIBVaFi.gz"
      sha256 "66d0e20aa9332a6e0ae3de1bb22564e0e9e341e3c82bfd2cf947da5949695601"
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
