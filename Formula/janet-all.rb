# Janet ALL-in-One Homebrew Formula (public tap)
# Source: https://github.com/MzxzD/Janet-seed (public; works without GitHub auth)
# Tap: brew tap MzxzD/janet && brew install janet-all
class JanetAll < Formula
  desc "Janet API server + menu bar from public janet-seed"
  homepage "https://github.com/MzxzD/Janet-seed"
  url "https://github.com/MzxzD/Janet-seed/archive/refs/heads/main.zip"
  version "0.1.1"
  sha256 "d6c33c6e4bc1aae8c3bf833618fc81e8c154ded7e7ae7a45f8d8673e85580d32"
  license "GPL-3.0-or-later"

  option "with-full", "Install full requirements.txt (voice, ChromaDB) — slower"

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

    (bin/"janet-server").write <<~EOS
      #!/bin/bash
      cd "#{janet_root}" && exec "#{py}" janet_api_server.py "$@"
    EOS

    (bin/"janet-menubar").write <<~EOS
      #!/bin/bash
      cd "#{janet_root}" && exec "#{py}" janet_menubar.py "$@"
    EOS

    chmod 0755, [bin/"janet-server", bin/"janet-menubar"]

    (prefix/"share/doc/janet-all/README").write <<~EOS
      Janet (public janet-seed)
      - API + WebSocket: janet-server → http://localhost:8080 (paths /ws, /ws/chat)
      - Menu bar (macOS): janet-menubar
      Source: #{homepage}
    EOS
  end

  test do
    assert_predicate bin/"janet-server", :exist?
    assert_predicate bin/"janet-menubar", :exist?
    system libexec/"bin/python", "-c",
           "import sys; sys.path.insert(0, '#{libexec}/janet-seed'); import janet_api_server; print('ok')"
  end
end
