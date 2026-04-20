# frozen_string_literal: true

class JanetPortableXrdesk < Formula
  desc "Janet Portable launcher + JanetXRDesk (RustDesk OSS) share tree"
  homepage "https://github.com/MzxzD/janet-portable-xrdesk"
  url "https://github.com/MzxzD/janet-portable-xrdesk/archive/refs/tags/v0.1.0.tar.gz"
  version "0.1.0"
  # Verified from GitHub tag tarball (2026-04-20):
  #   curl -sL .../archive/refs/tags/v0.1.0.tar.gz | shasum -a 256
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "MIT"

  depends_on "MzxzD/janet/janet-all"

  def install
    cd "janet-portable-xrdesk-#{version}" do
      bin.install "bin/janet-portable"
      chmod 0755, bin/"janet-portable"
      (share/"janet-portable-xrdesk").install Dir["share/janet-portable-xrdesk/*"]
      chmod 0755, share/"janet-portable-xrdesk/scripts/detect_device.sh"
    end
  end

  def caveats
    doc = share/"janet-portable-xrdesk/janet-xrdesk/SELF_HOSTING.md"
    <<~EOS
      Starts Janet via `janet-server` (from janet-all). Run:
        janet-portable

      RustDesk client (optional):
        brew install --cask rustdesk

      Self-host hbbs/hbbr + sidecar:
        #{doc}

      Bump version: tag a new release on GitHub, update url/sha256 in this formula.
    EOS
  end

  test do
    assert_predicate bin/"janet-portable", :exist?
    assert_predicate share/"janet-portable-xrdesk/janet-xrdesk/README.md", :exist?
  end
end
