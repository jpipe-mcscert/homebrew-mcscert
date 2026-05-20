require "formula"

class JpipeAT204 < Formula

    homepage "https://github.com/jpipe-mcscert/jpipe-compiler"

    url "https://github.com/jpipe-mcscert/jpipe-compiler/releases/download/v2.0.4/jpipe-2.0.4.tar.gz"
    sha256 "85956b2d3f005de7c594a35f4ed168c9cd72d5020e6fe9b0b80f2b147b0c470f"

    depends_on "graphviz"
    depends_on "openjdk@25"


    def install
        inreplace "jpipe", "@@PREFIX@@", "#{prefix}"
        inreplace "jpipe", "@@JAVA@@", Formula["openjdk@25"].opt_bin/"java"
        prefix.install "jpipe.jar"
        bin.install "jpipe"
    end
end