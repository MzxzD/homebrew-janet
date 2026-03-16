# frozen_string_literal: true

class JanetPeer < Formula
  desc "Peer-to-peer mesh network daemon for Janet AI ecosystem"
  homepage "https://github.com/MzxzD/Janet-Projects"
  url "https://github.com/MzxzD/Janet-Projects/archive/refs/heads/main.tar.gz"
  version "1.0.0"
  sha256 "188a70aa81a31cb5b20625bb5a6ae7bba1f61cb04d15480753335ea7ffdaef84"
  license "GPL-3.0-or-later"

  depends_on "rust" => :build

  def install
    base = if (buildpath/"Janet-Projects-main").directory?
      buildpath/"Janet-Projects-main"
    else
      buildpath
    end
    cd base/"janet-peer" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "janet-peer", shell_output("#{bin}/janet-peer --help 2>&1", 1)
  end
end
