class Bsc < Formula
  desc "BlueSpec Verilog Compiler and Simulator"
  homepage "https://github.com/B-Lang-org/bsc"
  url "https://github.com/BracketMaster/homebrew-rtl/releases/download/v1.0/bsc.tar.gz"
  version "2017.07.A"
  sha256 "03bdb147e8c68657a713c0977fa9f66524d4d4f1be0bdcfb8235d44918d8051f"

  bottle do
    root_url "https://github.com/BracketMaster/homebrew-rtl/releases/download/v1.0"
    cellar :any
    sha256 "dfef6397e6674b56c3f2b0e274e34c7c50ab0d3b89ef2d01ec3660c92ad520c1" => :catalina
    sha256 "b73409f1ae2180e446f9a9f1946773b62bcafa1b66734e29adfa78efbc1c6b19" => :high_sierra
  end

  head do
    url "https://github.com/B-Lang-org/bsc", :using => :git
  end

  depends_on "autoconf" => :build
  depends_on "cabal-install"
  depends_on "fontconfig"
  depends_on "ghc"
  depends_on "gperf"
  depends_on "icarus-verilog"
  depends_on "pkg-config" => :build

  def install
    bsc = "#{libexec}/bin/bsc"
    bluetcl = "#{libexec}/bin/bluetcl"
    bluewish = "#{libexec}/bin/bluewish"

    system "cabal", "update"
    system "cabal",
           "v1-install",
           "old-time",
           "regex-compat",
           "split",
           "syb"

    system "make",
           "-j2",
           "PREFIX=#{libexec}",
           "GHCJOBS=4",
           "GHCRTSFLAGS=+RTS -M4500M -A128m -RTS",
           "MACOSX_DEPLOYMENT_TARGET=10.15"

    bin.write_exec_script(bsc)
    bin.write_exec_script(bluetcl)
    bin.write_exec_script(bluewish)

    dest = prefix/"test"
    mkdir_p dest
    cp_r "examples/smoke_test/Makefile",
         dest/"Makefile"
    cp_r "examples/smoke_test/FibOne.bsv",
         dest/"FibOne.bsv"
    cp_r "examples/smoke_test/mkFibOne.out.expected",
         dest/"mkFibOne.out.expected"
  end

  test do
    system bin/"bsc", "-v"

    dest = testpath
    cp_r prefix/"test/Makefile",
         dest/"Makefile"
    cp_r prefix/"test/FibOne.bsv",
         dest/"FibOne.bsv"
    cp_r prefix/"test/mkFibOne.out.expected",
         dest/"mkFibOne.out.expected"

    system "make", "clean"

    system "make",
           "smoke_test_bluesim",
           "BSC=#{bin}/bsc",
           "VSIM=-vsim #{bin}/iverilog"
  end
end
