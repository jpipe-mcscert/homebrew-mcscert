require "formula"

class JpipeRunnerAT < Formula
  include Language::Python::Virtualenv

  homepage "https://github.com/jpipe-mcscert/jpipe-runner"
  url "https://github.com/jpipe-mcscert/jpipe-runner/releases/download/v2.0.0b12/jpipe_runner-2.0.0b12.tar.gz"
  sha256 "adc733dd27313b51b2349d78d304bfce073d3b1895588d5d2ba60f409cc635c8"

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
