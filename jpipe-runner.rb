require "formula"

class JpipeRunner < Formula
    include Language::Python::Virtualenv

    homepage "https://github.com/jpipe-mcscert/jpipe-runner"
    url "https://github.com/jpipe-mcscert/jpipe-runner/releases/download/v3.4.0/jpipe_runner-3.4.0.tar.gz"
    sha256 "7158d1748c85d8a0bf0d0a4da8a62b4207c4b1c4a3147aa5d6d00c0aeeeb4613"

    depends_on "python@3.11"
    depends_on "libjpeg-turbo"
    depends_on "freetype"
    depends_on "graphviz"

    

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
