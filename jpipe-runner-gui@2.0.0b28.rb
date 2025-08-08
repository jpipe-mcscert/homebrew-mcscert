require "formula"

class JpipeRunnerGuiAT200b28 < Formula
    include Language::Python::Virtualenv

    homepage "https://github.com/jpipe-mcscert/jpipe-runner"
    url "https://github.com/jpipe-mcscert/jpipe-runner/releases/download/v2.0.0b28/jpipe_runner-2.0.0b28.tar.gz"
    sha256 "1a1729430d1dc78cfdf0e42c354a71b78be36520e505db008539f2264636df30"

    depends_on "python@3.11"
    depends_on "python-tk@3.11"
    depends_on "libjpeg-turbo"
    depends_on "freetype"
    depends_on "graphviz"

    
  resource "contourpy" do
    url "https://files.pythonhosted.org/packages/58/01/1253e6698a07380cd31a736d248a3f2a50a7c88779a1813da27503cadc2a/contourpy-1.3.3.tar.gz"
    sha256 "083e12155b210502d0bca491432bb04d56dc3432f95a979b429f2848c3dbe880"
  end

  resource "cycler" do
    url "https://files.pythonhosted.org/packages/a9/95/a3dbbb5028f35eafb79008e7522a75244477d2838f38cbb722248dabc2a8/cycler-0.12.1.tar.gz"
    sha256 "88bb128f02ba341da8ef447245a9e138fae777f6a23943da4540077d3601eb1c"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/8a/27/ec3c723bfdf86f34c5c82bf6305df3e0f0d8ea798d2d3a7cb0c0a866d286/fonttools-4.59.0.tar.gz"
    sha256 "be392ec3529e2f57faa28709d60723a763904f71a2b63aabe14fee6648fe3b14"
  end

  resource "kiwisolver" do
    url "https://files.pythonhosted.org/packages/82/59/7c91426a8ac292e1cdd53a63b6d9439abd573c875c3f92c146767dd33faf/kiwisolver-1.4.8.tar.gz"
    sha256 "23d5f023bdc8c7e54eb65f03ca5d5bb25b601eac4d7f1a042888a1f45237987e"
  end

  resource "matplotlib" do
    url "https://files.pythonhosted.org/packages/43/91/f2939bb60b7ebf12478b030e0d7f340247390f402b3b189616aad790c366/matplotlib-3.10.5.tar.gz"
    sha256 "352ed6ccfb7998a00881692f38b4ca083c691d3e275b4145423704c34c909076"
  end

  resource "networkx" do
    url "https://files.pythonhosted.org/packages/6c/4f/ccdb8ad3a38e583f214547fd2f7ff1fc160c43a75af88e6aec213404b96a/networkx-3.5.tar.gz"
    sha256 "d4c6f9cf81f52d69230866796b82afbccdec3db7ae4fbd1b65ea750feed50037"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/37/7d/3fec4199c5ffb892bed55cff901e4f39a58c81df9c44c280499e92cad264/numpy-2.3.2.tar.gz"
    sha256 "e0486a11ec30cdecb53f184d496d1c6a20786c81e55e41640270130056f8ee48"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/a1/d4/1fc4078c65507b51b96ca8f8c3ba19e6a61c8253c72794544580a7b6c24d/packaging-25.0.tar.gz"
    sha256 "d443872c98d677bf60f6a1f2f8c1cb748e8fe762d2bf9d3148b5599295b0fc4f"
  end

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/f3/0d/d0d6dea55cd152ce3d6767bb38a8fc10e33796ba4ba210cbab9354b6d238/pillow-11.3.0.tar.gz"
    sha256 "3828ee7586cd0b2091b6209e5ad53e20d0649bbe87164a459d0676e035e8f523"
  end

  resource "pygraphviz" do
    url "https://files.pythonhosted.org/packages/66/ca/823d5c74a73d6b8b08e1f5aea12468ef334f0732c65cbb18df2a7f285c87/pygraphviz-1.14.tar.gz"
    sha256 "c10df02377f4e39b00ae17c862f4ee7e5767317f1c6b2dfd04cea6acc7fc2bea"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/bb/22/f1129e69d94ffff626bdb5c835506b3a5b4f3d070f17ea295e12c2c6f60f/pyparsing-3.2.3.tar.gz"
    sha256 "b9c13f1ab8b3b542f72e28f634bad4de758ab3ce4546e4301970ad6fa77c38be"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/66/c0/0c8b6ad9f17a802ee498c46e004a0eb49bc148f2fd230864601a86dcf6db/python-dateutil-2.9.0.post0.tar.gz"
    sha256 "37dd54208da7e1cd875388217d5e00ebd4179249f90fb72437e91a35459a0ad3"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17/pyyaml-6.0.2.tar.gz"
    sha256 "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

    def install
        ENV["SOURCE_DATE_EPOCH"] = Time.now.to_i.to_s
        virtualenv_install_with_resources
    end

    def post_install
      ohai "Verifying #{name} installation by checking command availability..."
      system bin/"jpipe-runner", "--help"
      ohai "#{name} installation verified successfully"
    rescue
      odie "#{name} verification failed. Please check Python dependencies and ensure all requirements are installed correctly."
    end
end
