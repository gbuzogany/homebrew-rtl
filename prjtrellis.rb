class Prjtrellis < Formula
  include Hardware
  desc "Project Trellis Library for ECP5 FPGA"
  homepage "https://github.com/SymbiFlow/prjtrellis"
  url "https://github.com/BracketMaster/homebrew-rtl/releases/download/v1.0/prjtrellis.tar.gz"
  sha256 "03a6194aa0c5cf4c00d0af62db73ce7d7871deb17e0325624f9372aa8a4ff9d9"

  bottle do
    root_url "https://github.com/BracketMaster/homebrew-rtl/releases/download/v1.0/"
    cellar :any
    sha256 "acf7cf521850b3c1e2feb181ed6b30e9653d80b1c62ea3ed09d906e42e735172" => :catalina
    sha256 "57220e6fda6a64052c8dd2541bcbd4e4b90666612ee5e99fe0768a7d83382e75" => :high_sierra
  end

  head do
    url "https://github.com/SymbiFlow/prjtrellis", :using => :git
  end

  depends_on "cmake" => :build
  depends_on "python3"
  depends_on "boost"
  depends_on "boost-python3"
  depends_on "open-ocd"
  depends_on "git"
  depends_on "yosys"

  def install
    if build.head?
      system "git",
            "fetch",
            "--unshallow"

      system "git",
            "pull",
            "--tags"
    end

    cd "libtrellis"
    system "cmake",
            "-DCMAKE_INSTALL_PREFIX=#{prefix}",
            "."
    system "make",
           "-j#{CPU.cores}"
    system "make",
           "install"
  end

  test do
    system "ecppll",
           "--clkin",
           "50",
           "--clkout0",
           "25"
  end
end
