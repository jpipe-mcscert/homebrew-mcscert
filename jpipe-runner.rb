require "formula"

class JpipeRunner < Formula
  include Language::Python::Virtualenv

  homepage "https://github.com/jpipe-mcscert/jpipe-runner"
  url "https://github.com/jpipe-mcscert/jpipe-runner/releases/download/v2.0.0b13/jpipe_runner-2.0.0b13.tar.gz"
  sha256 "13354bbd624bdc93ec6e2bdb0ae33c4b3ef3b68bcd3c2803a8513a86997a6479"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

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
