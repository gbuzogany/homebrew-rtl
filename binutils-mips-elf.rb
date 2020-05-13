class BinutilsMipsElf < Formula
    desc "GNU binary tools for native development"
    homepage "https://www.gnu.org/software/binutils/binutils.html"
    url "https://ftp.gnu.org/gnu/binutils/binutils-2.34.tar.xz"
    mirror "https://ftpmirror.gnu.org/binutils/binutils-2.34.tar.xz"
    sha256 "f00b0e8803dc9bab1e2165bd568528135be734df3fabf8d0161828cd56028952"
  
  bottle do
    root_url "https://github.com/BracketMaster/homebrew-rtl/releases/download/v1.0"
    sha256 "1e141b49b9c8184f5b85519a02b364663fe7975b9f8090e7b4db3fce79eb7c86" => :high_sierra
  end
    
    uses_from_macos "zlib"
  
    def install
      system "./configure", "--prefix=#{prefix}",
                            "--infodir=#{info}",
                            "--mandir=#{man}",
                            "--disable-werror",
                            "--target=mips-elf"
      system "make"
      system "make", "install"
      #Dir["#{bin}/*"].each do |f|
      #  bin.install_symlink f => File.basename(f)
      #end
    end
  
    test do
      assert_match "Usage:", shell_output("#{bin}/strings #{bin}/strings")
    end
  end
