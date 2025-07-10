require "formula"

class JpipeRunner < Formula

    include Language::Python::Virtualenv

    homepage "https://github.com/jpipe-mcscert/jpipe-runner"

    url "https://github.com/jpipe-mcscert/jpipe-runner/archive/refs/tags/v2.0.0.tar.gz"
    sha256 "38136a9527b930edc56867c20a17c92ae9e99e97d03eed57669fb58fe9bb2013"

    depends_on "python@3.10"

    def install
        venv = virtualenv_create(libexec, "python3.10")
        venv.pip_install resources
        venv.pip_install_and_link buildpath
    end
end

