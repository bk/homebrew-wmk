class Wmk < Formula
  desc "Flexible static site generator"
  homepage "https://wmk.baldr.net/"
  url "https://github.com/bk/wmk/archive/refs/tags/v0.9.8.tar.gz"
  sha256 "030e6576be3da00e82e1c1d326f441a04bd125320a2e516e39d6ab6682493d23"
  license "MIT"
  depends_on "fswatch"
  depends_on "python@3.10"
  depends_on "rsync"

  def install
    ENV.deparallelize
    prefix.install Dir["*"]
    cd prefix
    system "python3", "-m", "venv", "venv"
    system "venv/bin/pip", "install", "-r", "requirements.txt"
  end

  test do
    system "wmk", "--version"
  end
end
