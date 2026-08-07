require "formula"

class JpipeAT231 < Formula

    homepage "https://github.com/jpipe-mcscert/jpipe-compiler"

    url "https://github.com/jpipe-mcscert/jpipe-compiler/releases/download/v2.3.1/jpipe-2.3.1.tar.gz"
    sha256 "64d90f41340d141ebbef919ceb7370f7a7c77708303c110895563cf79a3ea6e7"

    depends_on "graphviz"
    depends_on "openjdk@25"


    def install
        inreplace "jpipe", "@@PREFIX@@", "#{prefix}"
        inreplace "jpipe", "@@JAVA@@", Formula["openjdk@25"].opt_bin/"java"
        prefix.install "jpipe.jar"
        bin.install "jpipe"
    end
end