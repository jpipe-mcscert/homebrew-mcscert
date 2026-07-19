require "formula"

class JpipeAT220 < Formula

    homepage "https://github.com/jpipe-mcscert/jpipe-compiler"

    url "https://github.com/jpipe-mcscert/jpipe-compiler/releases/download/v2.2.0/jpipe-2.2.0.tar.gz"
    sha256 "36d7e3a2a83f2f3759e9bea60c0a661846bd0dfe22b84fdf0f3ceb63e3d17f0a"

    depends_on "graphviz"
    depends_on "openjdk@25"


    def install
        inreplace "jpipe", "@@PREFIX@@", "#{prefix}"
        inreplace "jpipe", "@@JAVA@@", Formula["openjdk@25"].opt_bin/"java"
        prefix.install "jpipe.jar"
        bin.install "jpipe"
    end
end