# frozen_string_literal: true

class JanetxapplePasswordsFusion < Formula
  desc "JanetXApple: Passwords Fusion - Keychain credential Double Soul for Janet"
  homepage "https://github.com/MzxzD/JanetXApple-Passwords-Fusion"
  url "https://github.com/MzxzD/JanetXApple-Passwords-Fusion/archive/main.tar.gz"
  version "0.1.0"
  sha256 "282eb1b813c5639229423d1051aa7d0bac1cb78ce9e3df7b4bf7b583597d47ba"
  license "GPL-3.0-or-later"

  depends_on "python@3.12"

  def install
    base = if (buildpath/"JanetXApple-Passwords-Fusion-main").directory?
      buildpath/"JanetXApple-Passwords-Fusion-main"
    else
      buildpath
    end
    odie "Package directory not found in archive" unless (base/"pyproject.toml").file?

    python = Formula["python@3.12"].opt_bin/"python3.12"
    system python.to_s, "-m", "venv", libexec.to_s
    pip = libexec/"bin/pip"
    safe_system pip.to_s, "install", base.to_s

    bin.install_symlink libexec/"bin/janetxapple"
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/janetxapple --version").strip)
  end
end
