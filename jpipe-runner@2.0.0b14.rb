require "formula"

class JpipeRunnerAT200b14 < Formula
  include Language::Python::Virtualenv

  homepage "https://github.com/jpipe-mcscert/jpipe-runner"
  url "https://github.com/jpipe-mcscert/jpipe-runner/releases/download/v2.0.0b14/jpipe_runner-2.0.0b14.tar.gz"
  sha256 "80b15926c7b7c01c34241b6e2daab930d0f417471af3b2f2418a9b155b92a873"

  depends_on "python@3.10"
  depends_on "python-tk@3.10"
  depends_on "libjpeg-turbo"
  depends_on "freetype"
  depends_on "graphviz"

  

  def install
   ENV["SOURCE_DATE_EPOCH"] = Time.now.to_i.to_s
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
