class Basez < Formula
  desc "Encode/decode data from base16, base32, base32hex, base64 or base64url stream"
  homepage "http://www.quarkline.net/basez/"
  url "http://www.quarkline.net/basez/download/basez-1.6.2.tar.gz"
  sha256 "2a9f821488791c2763ef0120c75c43dc83dd16567b7c416f30331889fd598937"
  license "GPL-3.0"

  depends_on "help2man" => :build
  conflicts_with "coreutils", because: "both install base32 binaries"

  def install
    ENV.deparallelize
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "basez", "--help"
  end
end
