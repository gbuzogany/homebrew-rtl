# typed: false
# frozen_string_literal: true

class Icestorm < Formula
  include Hardware
  desc "Project IceStorm FOSS Tools for Lattice ICE Family of FPGAs"
  homepage "https://github.com/cliffordwolf/icestorm"
  url "https://github.com/BracketMaster/homebrew-rtl/releases/download/v1.0/icestorm.tar.gz"
  sha256 "ccb5aed3e3ba12fbd512ef75111fb90bc32733a8503195c24e81401d0b71fb5a"

  bottle do
    root_url "https://github.com/BracketMaster/homebrew-rtl/releases/download/v1.0"
    sha256 cellar: :any, catalina:    "ee2586e0c0373c5a7aab8fd26896ac6a48d35f1325a681c7fbad6c6654d67287"
    sha256 cellar: :any, high_sierra: "2f515f0b55eb6a5459dda2d87a5e36d95fcb14d1fde810892ba48b1244f6d2f7"
  end

  head do
    url "https://github.com/cliffordwolf/icestorm", using: :git
  end

  depends_on "autoconf" => :build
  depends_on "cmake" => :build
  depends_on "make" => :build
  depends_on "mercurial" => :build
  depends_on "pkg-config" => :build
  depends_on "bison"
  depends_on "boost"
  depends_on "boost-python3"
  depends_on "gawk"
  depends_on "git"
  depends_on "gnu-sed"
  depends_on "graphviz"
  depends_on "libffi"
  depends_on "libftdi0"
  depends_on "python@3.9"
  depends_on "qt5"
  depends_on "xdot"

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
