class Wmk < Formula
  desc "Flexible static site generator"
  homepage "https://wmk.baldr.net/"
  url "https://github.com/bk/wmk/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "06b0ff00413d85f9b852dd5d0c754aa7f15dd65a9ed00f38b6cd0394bc9f9864"
  license "MIT"
  version "1.2.3"
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
