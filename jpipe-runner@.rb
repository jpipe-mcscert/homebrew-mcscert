require "formula"

class JpipeRunnerAT < Formula
    include Language::Python::Virtualenv

    homepage "https://github.com/jpipe-mcscert/jpipe-runner"
    url "https://github.com/jpipe-mcscert/jpipe-runner/releases/download//jpipe_runner-2.0.0b26.tar.gz"
    sha256 "1c5bfdae3b1d4306023acf4fad8d7d69f1a9a70417ea1a0f26793058fc3f9db9"

    depends_on "python@3.11"
    depends_on "libjpeg-turbo"
    depends_on "freetype"
    depends_on "graphviz"

    
  resource "networkx" do
    url "https://files.pythonhosted.org/packages/6c/4f/ccdb8ad3a38e583f214547fd2f7ff1fc160c43a75af88e6aec213404b96a/networkx-3.5.tar.gz"
    sha256 "d4c6f9cf81f52d69230866796b82afbccdec3db7ae4fbd1b65ea750feed50037"
  end

  resource "pygraphviz" do
    url "https://files.pythonhosted.org/packages/66/ca/823d5c74a73d6b8b08e1f5aea12468ef334f0732c65cbb18df2a7f285c87/pygraphviz-1.14.tar.gz"
    sha256 "c10df02377f4e39b00ae17c862f4ee7e5767317f1c6b2dfd04cea6acc7fc2bea"
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
