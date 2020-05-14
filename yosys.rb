class Yosys < Formula
  desc "Framework for Verilog RTL synthesis"
  homepage "http://www.clifford.at/yosys/"
  url "https://github.com/YosysHQ/yosys/archive/yosys-0.9.tar.gz"
  sha256 "f2e31371f9cf1b36cb4f57b23fd6eb849adc7d935dcf49f3c905aa5136382c2f"
  revision 2
  head "https://github.com/YosysHQ/yosys.git"

  bottle do
    root_url "https://github.com/BracketMaster/homebrew-rtl/releases/download/v1.0"
    sha256 "956cf3935fbe3d09eef7f1fd23deb3b987025d34dce6e0cf3bcebf5656c4dc07" => :x86_64_linux
    sha256 "f5936eafc40797ee2eadd0a861bfe0d231b334a78ccf35d0cbc7da56f3419795" => :high_sierra
  end

  depends_on "bison" => :build
  depends_on "pkg-config" => :build
  depends_on "flex" => :build
  depends_on "make" => :build
  depends_on "git" => :build
  depends_on "tcl-tk" => :build
  depends_on "libffi"
  depends_on "python@3.8"
  depends_on "readline"

  def install
    system "make", "install", "PREFIX=#{prefix}", "PRETTY=0"
  end

  test do
    system "#{bin}/yosys", "-p", "hierarchy; proc; opt; techmap; opt;", "-o", "synth.v", "#{pkgshare}/adff2dff.v"
  end
end
