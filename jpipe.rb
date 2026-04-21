require "formula"

class Jpipe < Formula

    homepage "https://github.com/jpipe-mcscert/jpipe-compiler"

    url "https://github.com/jpipe-mcscert/jpipe-compiler/releases/download/v2.0.0/jpipe-2.0.0.tar.gz"
    sha256 "c0051e4b9ac020e40982d9189fdbd7177a542b61645c808e9eff1bd8604c19cf"

    depends_on "graphviz"
    depends_on "openjdk@25"


    def install
        inreplace "jpipe", "@@PREFIX@@", "#{prefix}"
        inreplace "jpipe", "@@JAVA@@", Formula["openjdk@25"].opt_bin/"java"
        prefix.install "jpipe.jar"
        bin.install "jpipe"
    end
end