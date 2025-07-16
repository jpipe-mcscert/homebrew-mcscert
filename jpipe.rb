require "formula"

class Jpipe < Formula

    homepage "https://github.com/jpipe-mcscert/jpipe-compiler"

    url "https://github.com/ace-design/jpipe/releases/download/0.2.0/jpipe-0.2.0.tar.gz"
    sha256 "6c982bbfd5146427a569d35b2290c2c292652a43dc86e129c1b29247b6ae4f21"

    depends_on "graphviz"
    depends_on "openjdk@21"


    def install
        inreplace "jpipe", "@@PREFIX@@", "#{prefix}"
        inreplace "jpipe", "@@JAVA@@", Formula["openjdk@21"].opt_bin/"java"
        prefix.install "jpipe.jar"
        bin.install "jpipe"
    end
end