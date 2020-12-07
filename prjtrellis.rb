class Prjtrellis < Formula
  include Hardware
  desc "Project Trellis Library for ECP5 FPGA"
  homepage "https://github.com/SymbiFlow/prjtrellis"
  url "https://github.com/BracketMaster/homebrew-rtl/releases/download/v1.0/prjtrellis.tar.gz"
  sha256 "03a6194aa0c5cf4c00d0af62db73ce7d7871deb17e0325624f9372aa8a4ff9d9"

  bottle do
    root_url "https://github.com/BracketMaster/homebrew-rtl/releases/download/v1.0/"
    cellar :any
    sha256 "b4c55e70c4240e9a84d42096e9f5bb4dbe3795e78ef1c6cea334188ade6ab30d" => :high_sierra
  end

  head do
    url "https://github.com/SymbiFlow/prjtrellis", :using => :git
  end

  depends_on "cmake" => :build
  depends_on "python@3.9"
  depends_on "boost"
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
