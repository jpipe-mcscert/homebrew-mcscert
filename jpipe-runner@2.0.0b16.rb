require "formula"

class JpipeRunnerAT200b16 < Formula
  include Language::Python::Virtualenv

  homepage "https://github.com/jpipe-mcscert/jpipe-runner"
  url "https://github.com/jpipe-mcscert/jpipe-runner/releases/download/v2.0.0b16/jpipe_runner-2.0.0b16.tar.gz"
  sha256 "b0c96a3c06eb5bec7f544654b7dfbcff932908c3a525148a0ed14caf55ebfc6a"

  depends_on "python@3.10"
  # depends_on "python-tk@3.10"
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
