require "formula"

class JpipeAT19 < Formula

    homepage "https://github.com/jpipe-mcscert/jpipe-compiler"

    url "https://github.com/jpipe-mcscert/jpipe-compiler/releases/download/1.9.0/jpipe.jar"
    sha256 "ebc360d75e7b3d155b59a3fffa151f7038ea36b85fea53f9323b18c78db2823f"

    depends_on "graphviz"
    depends_on "openjdk@25"


    def install
        inreplace "jpipe", "@@PREFIX@@", "#{prefix}"
        inreplace "jpipe", "@@JAVA@@", Formula["openjdk@25"].opt_bin/"java"
        prefix.install "jpipe.jar"
        bin.install "jpipe"
    end
end