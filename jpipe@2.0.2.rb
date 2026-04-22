require "formula"

class JpipeAT202 < Formula

    homepage "https://github.com/jpipe-mcscert/jpipe-compiler"

    url "https://github.com/jpipe-mcscert/jpipe-compiler/releases/download/v2.0.2/jpipe-2.0.2.tar.gz"
    sha256 "0295b6854e9ca943a07e24db360036b826457423a0a10182b994ba60a60f2249"

    depends_on "graphviz"
    depends_on "openjdk@25"


    def install
        inreplace "jpipe", "@@PREFIX@@", "#{prefix}"
        inreplace "jpipe", "@@JAVA@@", Formula["openjdk@25"].opt_bin/"java"
        prefix.install "jpipe.jar"
        bin.install "jpipe"
    end
end