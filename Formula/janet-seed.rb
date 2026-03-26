# frozen_string_literal: true

class JanetSeed < Formula
  desc "Janet AI core - constitutional, offline-first AI companion"
  homepage "https://github.com/MzxzD/Janet-seed"
  url "https://github.com/MzxzD/Janet-seed/archive/refs/heads/main.zip"
  version "0.1.1"
  sha256 "d6c33c6e4bc1aae8c3bf833618fc81e8c154ded7e7ae7a45f8d8673e85580d32"
  license "GPL-3.0-or-later"

  option "with-full", "Install full dependencies (voice, ChromaDB, learning) - slower install"

  depends_on "python@3.12"
  depends_on "ollama" => :recommended
  depends_on "portaudio" => :recommended

  def install
    base = if (buildpath/"Janet-seed-main").directory?
      buildpath/"Janet-seed-main"
    else
      buildpath
    end
    req_name = build.with?("full") ? "requirements.txt" : "requirements-core.txt"
    odie "janet-seed: missing #{req_name}" unless (base/req_name).exist?

    python = Formula["python@3.12"].opt_bin/"python3.12"
    system python, "-m", "venv", libexec
    pip = libexec/"bin/pip"
    safe_system pip, "install", "-r", (base/req_name).to_s

    (libexec/"janet-seed").install base.children

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

    chmod 0755, [bin/"janet-api-server", bin/"janet-core"]
  end

  test do
    cd libexec/"janet-seed" do
      assert_equal "OK", shell_output("#{libexec}/bin/python -c 'from src.constitution_loader import Constitution; print(\"OK\")'").strip
    end
  end
end
