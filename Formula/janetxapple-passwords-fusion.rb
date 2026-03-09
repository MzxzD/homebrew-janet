# frozen_string_literal: true

class JanetxapplePasswordsFusion < Formula
  desc "JanetXApple: Passwords Fusion - Keychain credential Double Soul for Janet"
  homepage "https://github.com/MzxzD/Janet-Projects"
  url "https://github.com/MzxzD/Janet-Projects/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  sha256 "188a70aa81a31cb5b20625bb5a6ae7bba1f61cb04d15480753335ea7ffdaef84"
  license "GPL-3.0-or-later"

  depends_on "python@3.12"

  def install
    base = if (buildpath/"Janet-Projects-main").directory?
      buildpath/"Janet-Projects-main"
    else
      buildpath
    end
    pkg_dir = base/"JanetXApple-Passwords-Fusion"
    odie "JanetXApple-Passwords-Fusion directory not found in archive" unless pkg_dir.directory?

    python = Formula["python@3.12"].opt_bin/"python3.12"
    system python.to_s, "-m", "venv", libexec.to_s
    pip = libexec/"bin/pip"
    safe_system pip.to_s, "install", pkg_dir.to_s

    bin.install_symlink libexec/"bin/janetxapple"
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/janetxapple --version").strip)
  end
end
