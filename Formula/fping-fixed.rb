class FpingFixed < Formula
  desc "Scriptable ping program for checking if multiple hosts are up"
  homepage "https://fping.org/"
  url "https://fping.org/dist/fping-4.4.tar.gz"
  sha256 "9f854b65a52dc7b1749d6743e35d0a6268179d1a724267339fc9a066b2b72d11"
  license "BSD-3-Clause"

  conflicts_with "fping", because: "both install fping binaries"
  
  head do
    url "https://github.com/schweikert/fping.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  def install
    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--sbindir=#{bin}"
    system "make", "install"
  end

  test do
    assert_equal "::1 is alive", shell_output("#{bin}/fping -A localhost").chomp
  end
end
