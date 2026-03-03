# frozen_string_literal: true

class JanetSeed < Formula
  include Language::Python::Virtualenv

  desc "Janet AI core - constitutional, offline-first AI companion"
  homepage "https://github.com/MzxzD/Janet-Projects"
  url "https://github.com/MzxzD/Janet-Projects/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  sha256 "188a70aa81a31cb5b20625bb5a6ae7bba1f61cb04d15480753335ea7ffdaef84"
  license "GPL-3.0-or-later"

  option "with-full", "Install full dependencies (voice, ChromaDB, learning) - slower install"

  depends_on "python@3.12"
  depends_on "ollama" => :recommended
  depends_on "portaudio" => :recommended

  def install
    base = if (buildpath/"Janet-Projects-main").directory?
      buildpath/"Janet-Projects-main"
    else
      buildpath
    end
    janet_seed_dir = base/"JanetOS/janet-seed"
    odie "janet-seed directory not found in archive" unless janet_seed_dir.directory?

    # Use single-arg form for compatibility with older Homebrew (Intel Mac /usr/local)
    venv = virtualenv_create(libexec)
    req_file = build.with?("full") ? "requirements.txt" : "requirements-core.txt"
    venv.pip_install "-r", janet_seed_dir/req_file

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
