class Icestorm < Formula
  include Hardware
  desc "Project IceStorm FOSS Tools for Lattice ICE Family of FPGAs"
  homepage "https://github.com/cliffordwolf/icestorm"
  url "https://github.com/BracketMaster/homebrew-rtl/releases/download/v1.0/icestorm.tar.gz"
  sha256 "ccb5aed3e3ba12fbd512ef75111fb90bc32733a8503195c24e81401d0b71fb5a"

  head do
    url "https://github.com/cliffordwolf/icestorm", :using => :git
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "make" => :build
  depends_on "mercurial" => :build
  depends_on "python3"
  depends_on "boost"
  depends_on "boost-python3"
  depends_on "libftdi0"
  depends_on "libffi"
  depends_on "bison"
  depends_on "gawk"
  depends_on "gnu-sed"
  depends_on "graphviz"
  depends_on "xdot"
  depends_on "git"
  depends_on "qt5"

  def install
    system "make",
           "-j#{CPU.cores}"

    system "make",
           "PREFIX=#{prefix}",
           "install"

          

  end

  test do

    system bin/"icepll"
  end
end
