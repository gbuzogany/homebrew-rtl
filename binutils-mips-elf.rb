class BinutilsMipsElf < Formula
    desc "GNU binary tools for native development"
    homepage "https://www.gnu.org/software/binutils/binutils.html"
    url "https://ftp.gnu.org/gnu/binutils/binutils-2.34.tar.xz"
    mirror "https://ftpmirror.gnu.org/binutils/binutils-2.34.tar.xz"
    sha256 "f00b0e8803dc9bab1e2165bd568528135be734df3fabf8d0161828cd56028952"
  
  bottle do
    root_url "https://github.com/BracketMaster/homebrew-rtl/releases/download/v1.0"
    sha256 "1e141b49b9c8184f5b85519a02b364663fe7975b9f8090e7b4db3fce79eb7c86" => :high_sierra
    sha256 "96ec0c4d6c27c61e1c6344ef7474015ed764a6c41dd56730c0dc58f6ae92433f" => :x86_64_linux
  end
    
    uses_from_macos "zlib"
    depends_on "texinfo" => :build
  
    def install
      system "./configure", "--prefix=#{libexec}",
                            "--bindir=#{prefix}/bin",
                            "--disable-werror",
                            "--target=mips-elf"
      system "make"
      system "make", "install"
    end
  
    test do
      assert_match "Usage:", shell_output("#{bin}/strings #{bin}/strings")
    end
  end
