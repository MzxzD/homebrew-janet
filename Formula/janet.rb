# frozen_string_literal: true

class Janet < Formula
  desc "Voice-first, offline, constitutional AI ecosystem"
  homepage "https://github.com/MzxzD/Janet-Projects"
  # Public archive (janet-seed); meta-formula only installs docs — avoids private Janet-Projects tarball for brew fetch
  url "https://github.com/MzxzD/Janet-seed/archive/refs/heads/main.zip"
  version "0.1.1"
  sha256 "d6c33c6e4bc1aae8c3bf833618fc81e8c154ded7e7ae7a45f8d8673e85580d32"
  license "GPL-3.0-or-later"

  depends_on "MzxzD/janet/janet-seed"
  depends_on "ollama" => :recommended
  depends_on "MzxzD/janet/janet-awakening" => :recommended
  depends_on "MzxzD/janet/janet-arm64-toolchain" => :optional
  depends_on "MzxzD/janet/janet-peer" => :optional

  def install
    pkgshare.mkpath
    (pkgshare/"README").write <<~EOS
      Janet AI ecosystem - voice-first, offline, constitutional
      Commands: janet-api-server, janet-core, janet-awakening, janet-peer, janet-as
    EOS
  end

  test do
    assert_predicate Formula["MzxzD/janet/janet-seed"], :installed?
  end
end
