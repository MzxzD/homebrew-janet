# frozen_string_literal: true

class JanetArm64Toolchain < Formula
  desc "ARM64 assembler and compiler for Apple Silicon (JanetOS)"
  homepage "https://github.com/MzxzD/Janet-Projects"
  url "https://github.com/MzxzD/Janet-Projects/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "GPL-3.0-or-later"

  depends_on "rust" => :build

  def install
    base = if (buildpath/"Janet-Projects-main").directory?
      buildpath/"Janet-Projects-main"
    else
      buildpath
    end
    cd base/"janet-arm64-toolchain" do
      system "cargo", "install", "--path", "crates/assembler", *std_cargo_args
    end
  end

  test do
    assert_match "janet-as", shell_output("#{bin}/janet-as --help 2>&1", 1)
  end
end
