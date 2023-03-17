class Wmk < Formula
  desc "Flexible static site generator"
  homepage "https://wmk.baldr.net/"
  url "https://github.com/bk/wmk/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "c5725df15fc9e55267a70a403f46e9f851026576c932d5128331cdbec151dab8"
  license "MIT"
  version "1.1.0"
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
