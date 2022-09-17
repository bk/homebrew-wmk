class Wmk < Formula
  desc "Flexible static site generator"
  homepage "https://wmk.baldr.net/"
  url "https://github.com/bk/wmk/archive/refs/tags/v0.9.10.tar.gz"
  sha256 "046564c8fa332cb46bd27249a2a2a79ca8601dab67b74615a447e32675e8a309"
  license "MIT"
  version "0.9.10"
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
