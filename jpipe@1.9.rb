require "formula"

class JpipeAT19 < Formula

    homepage "https://github.com/jpipe-mcscert/jpipe-compiler"

    url "https://github.com/jpipe-mcscert/jpipe-compiler/releases/download/1.9.0/jpipe-1.9.0.tar.gz"
    sha256 "570d49cdb4180dbbf429127c98495f68082b71ee6dc9c33f49d4cb21c081a59a"

    depends_on "graphviz"
    depends_on "openjdk@25"


    def install
        inreplace "jpipe", "@@PREFIX@@", "#{prefix}"
        inreplace "jpipe", "@@JAVA@@", Formula["openjdk@25"].opt_bin/"java"
        prefix.install "jpipe.jar"
        bin.install "jpipe"
    end
end