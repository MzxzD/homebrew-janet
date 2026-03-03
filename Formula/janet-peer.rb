# frozen_string_literal: true

class JanetPeer < Formula
  desc "Peer-to-peer mesh network daemon for Janet AI ecosystem"
  homepage "https://github.com/MzxzD/Janet-Projects"
  url "https://github.com/MzxzD/Janet-Projects/archive/refs/heads/main.tar.gz"
  version "1.0.0"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "GPL-3.0-or-later"

  depends_on "rust" => :build

  def install
    peer_dir = (buildpath/"Janet-Projects-main").directory? ?
               buildpath/"Janet-Projects-main/janet-peer" : buildpath/"janet-peer"
    cd peer_dir do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "janet-peer", shell_output("#{bin}/janet-peer --help 2>&1", 1)
  end
end
