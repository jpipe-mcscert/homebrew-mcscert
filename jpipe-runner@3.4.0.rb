require "formula"

class JpipeRunnerAT340 < Formula
    include Language::Python::Virtualenv

    homepage "https://github.com/jpipe-mcscert/jpipe-runner"
    url "https://github.com/jpipe-mcscert/jpipe-runner/releases/download/v3.4.0/jpipe_runner-3.4.0.tar.gz"
    sha256 "7158d1748c85d8a0bf0d0a4da8a62b4207c4b1c4a3147aa5d6d00c0aeeeb4613"

    depends_on "python@3.11"
    depends_on "libjpeg-turbo"
    depends_on "freetype"
    depends_on "graphviz"

      resource "attrs" do
    url "https://files.pythonhosted.org/packages/64/b4/17d4b0b2a2dc85a6df63d1157e028ed19f90d4cd97c36717afef2bc2f395/attrs-26.1.0-py3-none-any.whl"
    sha256 "c647aa4a12dfbad9333ca4e71fe62ddc36f4e63b2d260a37a8b83d2f043ac309"
  end
  resource "graphviz" do
    url "https://files.pythonhosted.org/packages/91/4c/e0ce1ef95d4000ebc1c11801f9b944fa5910ecc15b5e351865763d8657f8/graphviz-0.21-py3-none-any.whl"
    sha256 "54f33de9f4f911d7e84e4191749cac8cc5653f815b06738c54db9a15ab8b1e42"
  end
  resource "jsonschema-specifications" do
    url "https://files.pythonhosted.org/packages/41/45/1a4ed80516f02155c51f51e8cedb3c1902296743db0bbc66608a0db2814f/jsonschema_specifications-2025.9.1-py3-none-any.whl"
    sha256 "98802fee3a11ee76ecaca44429fda8a41bff98b00a0f2838151b113f210cc6fe"
  end
  resource "jsonschema" do
    url "https://files.pythonhosted.org/packages/69/90/f63fb5873511e014207a475e2bb4e8b2e570d655b00ac19a9a0ca0a385ee/jsonschema-4.26.0-py3-none-any.whl"
    sha256 "d489f15263b8d200f8387e64b4c3a75f06629559fb73deb8fdfb525f2dab50ce"
  end
  resource "networkx" do
    url "https://files.pythonhosted.org/packages/eb/8d/776adee7bbf76365fdd7f2552710282c79a4ead5d2a46408c9043a2b70ba/networkx-3.5-py3-none-any.whl"
    sha256 "0030d386a9a06dee3565298b4a734b68589749a544acbb6c412dc9e2489ec6ec"
  end
  on_arm do
    resource "pyyaml" do
      url "https://files.pythonhosted.org/packages/8b/62/b9faa998fd185f65c1371643678e4d58254add437edb764a08c5a98fb986/PyYAML-6.0.2-cp311-cp311-macosx_11_0_arm64.whl"
      sha256 "1e2120ef853f59c7419231f3bf4e7021f1b936f6ebd222406c3b60212205d2ee"
    end
  end
  on_intel do
    resource "pyyaml" do
      url "https://files.pythonhosted.org/packages/f8/aa/7af4e81f7acba21a4c6be026da38fd2b872ca46226673c89a758ebdc4fd2/PyYAML-6.0.2-cp311-cp311-macosx_10_9_x86_64.whl"
      sha256 "cc1c1159b3d456576af7a3e4d1ba7e6924cb39de8f67111c735f6fc832082774"
    end
  end
  resource "referencing" do
    url "https://files.pythonhosted.org/packages/2c/58/ca301544e1fa93ed4f80d724bf5b194f6e4b945841c5bfd555878eea9fcb/referencing-0.37.0-py3-none-any.whl"
    sha256 "381329a9f99628c9069361716891d34ad94af76e461dcb0335825aecc7692231"
  end
  on_arm do
    resource "rpds-py" do
      url "https://files.pythonhosted.org/packages/94/ba/24e5ebb7c1c82e74c4e4f33b2112a5573ddc703915b13a073737b59b86e0/rpds_py-0.30.0-cp311-cp311-macosx_11_0_arm64.whl"
      sha256 "dc4f992dfe1e2bc3ebc7444f6c7051b4bc13cd8e33e43511e8ffd13bf407010d"
    end
  end
  on_intel do
    resource "rpds-py" do
      url "https://files.pythonhosted.org/packages/4d/6e/f964e88b3d2abee2a82c1ac8366da848fce1c6d834dc2132c3fda3970290/rpds_py-0.30.0-cp311-cp311-macosx_10_12_x86_64.whl"
      sha256 "a2bffea6a4ca9f01b3f8e548302470306689684e61602aa3d141e34da06cf425"
    end
  end
  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/18/67/36e9267722cc04a6b9f15c7f3441c2363321a3ea07da7ae0c0707beb2a9c/typing_extensions-4.15.0-py3-none-any.whl"
    sha256 "f0fa19c6845758ab08074a0cfa8b7aecb71c999ca73d62883bc25cc018c4e548"
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
