class Tvm < Formula
    desc "compiler stack for deep learning systems"
    homepage "https://tvm.apache.org"
    url "https://github.com/BracketMaster/homebrew-rtl/releases/download/v1.0/tvm.tar.gz"
    sha256 "aba1e98a0bb39a55d7f03f3a0f7961bd85112900ab67a45cfaf19746690745a2"
    revision 1
    head "https://github.com/apache/incubator-tvm"
  
    depends_on "cmake" => :build
    depends_on "python@3.8"
    depends_on "ncurses"
    depends_on "zlib"
    depends_on "libedit"
    depends_on "libxml2"
    depends_on "llvm"
  
    def install
      mkdir_p "build"
      cp_r "cmake/config.cmake", "build"
      cd "build"
      system "cmake", ".."
      system "make", "install", "DESTDIR=#{prefix}"
    end
  
  end