require "formula"

class JpipeRunner < Formula
  include Language::Python::Virtualenv

  homepage "https://github.com/jpipe-mcscert/jpipe-runner"
  url "https://github.com/jpipe-mcscert/jpipe-runner/releases/download/v2.0.0b8/jpipe_runner-2.0.0b8.tar.gz"
  sha256 "37b161961d412e68526df7310b9580de320aab485070789cdc30e872559467c3"

  depends_on "python@3.10"
  depends_on "python-tk@3.10"
  depends_on "libjpeg-turbo"
  depends_on "freetype"

  def install
    venv = virtualenv_create(libexec, "python3.10")
    venv.pip_install resources
    venv.pip_install_and_link buildpath
  end
end
