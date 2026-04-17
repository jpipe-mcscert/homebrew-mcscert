require "formula"

class JpipeRunnerAT330 < Formula
    include Language::Python::Virtualenv

    homepage "https://github.com/jpipe-mcscert/jpipe-runner"
    url "https://github.com/jpipe-mcscert/jpipe-runner/releases/download/v3.3.0/jpipe_runner-3.3.0.tar.gz"
    sha256 "8114895a8ee24f74cce002b6e21762a02bab19f3da20a69e09adb7c6939525a8"

    depends_on "python@3.11"
    depends_on "libjpeg-turbo"
    depends_on "freetype"
    depends_on "graphviz"

    
  resource "graphviz" do
    url "https://files.pythonhosted.org/packages/f8/b3/3ac91e9be6b761a4b30d66ff165e54439dcd48b83f4e20d644867215f6ca/graphviz-0.21.tar.gz"
    sha256 "20743e7183be82aaaa8ad6c93f8893c923bd6658a04c32ee115edb3c8a835f78"
  end

  resource "networkx" do
    url "https://files.pythonhosted.org/packages/6c/4f/ccdb8ad3a38e583f214547fd2f7ff1fc160c43a75af88e6aec213404b96a/networkx-3.5.tar.gz"
    sha256 "d4c6f9cf81f52d69230866796b82afbccdec3db7ae4fbd1b65ea750feed50037"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17/pyyaml-6.0.2.tar.gz"
    sha256 "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
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
