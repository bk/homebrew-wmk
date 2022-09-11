class Wmk < Formula
  desc "Flexible static site generator"
  homepage "https://wmk.baldr.net/"
  url "https://github.com/bk/wmk/archive/refs/tags/v0.9.9.tar.gz"
  sha256 "b46d8eb24b54d1404074907d7678d9d90d4b6163e45ec7287d6ced7dac38b246"
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
