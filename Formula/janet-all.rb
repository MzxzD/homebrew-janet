# Janet ALL-in-One Homebrew Formula (public tap)
# Uses public MzxzD/Janet-seed. Tap: brew tap MzxzD/janet && brew install janet-all
class JanetAll < Formula
  include Language::Python::Virtualenv

  desc "Janet ecosystem: janet-seed API server, menu bar (macOS), optional orchestration"
  homepage "https://github.com/MzxzD/Janet-seed"
  url "https://github.com/MzxzD/Janet-seed/archive/refs/heads/main.zip"
  version "0.1.0"
  license "GPL-3.0-or-later"
  sha256 "ddb9528f7e11e19cf1a134d6f76908705c69184776ef1793a9f394a0fe49360c"

  depends_on "python@3.11"
  depends_on "ollama" => :recommended

  def install
    src = (buildpath/"Janet-seed-main").directory? ? buildpath/"Janet-seed-main" : buildpath
    req_file = (src/"requirements-core.txt").exist? ? "requirements-core.txt" : "requirements.txt"
    odie "janet-seed source not found (no requirements)" unless (src/req_file).exist?

    janet_seed_dest = libexec/"janet-seed"
    janet_seed_dest.mkpath
    cp_r Dir[src/"*"], janet_seed_dest
    req = janet_seed_dest/req_file
    odie "requirements file not found" unless req.exist?

    venv = virtualenv_create(libexec, "python3.11")
    system libexec/"bin/pip", "install", "-r", req.to_s

    (bin/"janet-server").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{janet_seed_dest}:$PYTHONPATH"
      exec "#{libexec}/bin/python" "#{janet_seed_dest}/janet_api_server.py" "$@"
    EOS
    chmod 0755, bin/"janet-server"

    (bin/"janet-menubar").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{janet_seed_dest}:$PYTHONPATH"
      exec "#{libexec}/bin/python" "#{janet_seed_dest}/janet_menubar.py" "$@"
    EOS
    chmod 0755, bin/"janet-menubar"

    (prefix/"share/doc/janet-all/README").write <<~EOS
      Janet ALL-in-One (janet-seed)
      - Start API:  janet-server
      - Menu bar:   janet-menubar  (macOS)
      See: #{homepage}
    EOS
  end

  test do
    assert_predicate bin/"janet-server", :exist?
    assert_predicate bin/"janet-menubar", :exist?
    system libexec/"bin/python", "-c", "import sys; sys.path.insert(0, '#{libexec}/janet-seed'); import janet_api_server; print('ok')"
  end
end
