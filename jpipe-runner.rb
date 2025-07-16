require "formula"

class JpipeRunner < Formula
  include Language::Python::Virtualenv

  homepage "https://github.com/jpipe-mcscert/jpipe-runner"
  url "https://github.com/jpipe-mcscert/jpipe-runner/releases/download/v2.0.0b11/jpipe_runner-2.0.0b11.tar.gz"
  sha256 "dc43cb8006529f6bdf9e552d69aa3d1ec8d7672bb85147cda475c10955571062"

  depends_on "python@3.11"
  depends_on "python-tk@3.11"
  depends_on "libjpeg-turbo"
  depends_on "freetype"

  def install
    virtualenv_install_with_resources
  end

  def post_install
    ohai "Verifying installation..."
    system bin/"jpipe-runner", "--help"
    ohai "should be working"
  rescue
    odie "will not work. have you updated python deps? RTFM."
  end
end
