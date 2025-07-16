require "formula"

class JpipeRunner < Formula
  include Language::Python::Virtualenv

  homepage "https://github.com/jpipe-mcscert/jpipe-runner"
  url "https://github.com/jpipe-mcscert/jpipe-runner/releases/download/v2.0.0b8/jpipe_runner-2.0.0b8.tar.gz"
  sha256 "37b161961d412e68526df7310b9580de320aab485070789cdc30e872559467c3"

  depends_on "python@3.12"
  depends_on "python-tk@3.12"
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
