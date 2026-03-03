# frozen_string_literal: true

class JanetSeed < Formula
  include Language::Python::Virtualenv

  desc "Janet AI core - constitutional, offline-first AI companion"
  homepage "https://github.com/MzxzD/Janet-Projects"
  url "https://github.com/MzxzD/Janet-Projects/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "GPL-3.0-or-later"

  depends_on "python@3.12"
  depends_on "ollama" => :recommended
  depends_on "portaudio" => :recommended

  def install
    base = (buildpath/"Janet-Projects-main").directory? ?
           buildpath/"Janet-Projects-main" : buildpath
    janet_seed_dir = base/"JanetOS/janet-seed"
    odie "janet-seed directory not found in archive" unless janet_seed_dir.directory?

    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install "-r", janet_seed_dir/"requirements.txt"

    (libexec/"janet-seed").install janet_seed_dir.children

    janet_root = libexec/"janet-seed"
    py = libexec/"bin/python"

    (bin/"janet-api-server").write <<~EOS
      #!/bin/bash
      cd "#{janet_root}" && exec "#{py}" janet_api_server.py "$@"
    EOS

    (bin/"janet-core").write <<~EOS
      #!/bin/bash
      cd "#{janet_root}" && exec "#{py}" -m src.main "$@"
    EOS

    chmod 0755, bin/"janet-api-server", bin/"janet-core"
  end

  test do
    cd libexec/"janet-seed" do
      system libexec/"bin/python", "-c", "from src.constitution_loader import Constitution; print('OK')"
    end
  end
end
