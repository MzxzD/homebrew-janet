# frozen_string_literal: true

class Janet < Formula
  desc "Voice-first, offline, constitutional AI ecosystem"
  homepage "https://github.com/MzxzD/Janet-Projects"
  url "https://github.com/MzxzD/Janet-Projects/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  sha256 "188a70aa81a31cb5b20625bb5a6ae7bba1f61cb04d15480753335ea7ffdaef84"
  license "GPL-3.0-or-later"

  depends_on "MzxzD/janet/janet-seed"
  depends_on "ollama" => :recommended
  depends_on "MzxzD/janet/janet-arm64-toolchain" => :optional
  depends_on "MzxzD/janet/janet-peer" => :optional

  def install
    pkgshare.mkpath
    (pkgshare/"README").write <<~EOS
      Janet AI ecosystem - voice-first, offline, constitutional
      Commands: janet-api-server, janet-core, janet-peer, janet-as
    EOS
  end

  test do
    assert_predicate Formula["MzxzD/janet/janet-seed"], :installed?
  end
end
