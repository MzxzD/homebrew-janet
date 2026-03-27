# frozen_string_literal: true

class JanetMesh < Formula
  desc "Janet + janet-peer P2P + Tailscale overlay (Ultimate-style cluster mesh)"
  homepage "https://github.com/MzxzD/Janet-Projects"
  # Stub tarball (meta-formula); pinned SHA tracks `main` — bump when janet-seed default branch moves
  url "https://github.com/MzxzD/Janet-seed/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  sha256 "e0e5c246f8d11e3cb3fb62421d08485dd2d1711b546f26d7576ab762f3e6690f"
  license "GPL-3.0-or-later"

  depends_on "MzxzD/janet/janet"
  depends_on "MzxzD/janet/janet-peer"
  # homebrew-core provides `tailscale` on macOS and Linux (avoid cask dep — fails `brew audit --strict` in taps)
  depends_on "tailscale"

  def install
    (bin/"janet-mesh-env").write <<~BASH
      #!/usr/bin/env bash
      set -euo pipefail
      echo "=== Janet mesh (Janet + janet-peer + Tailscale) ==="
      echo ""
      if command -v tailscale >/dev/null 2>&1; then
        echo "Tailscale:"
        tailscale status 2>/dev/null || echo "  (run: sudo tailscale up — or log in via Tailscale.app on macOS)"
        echo ""
        ip="$(tailscale ip -4 2>/dev/null || true)"
        if [[ -n "${ip:-}" ]]; then
          echo "This node's Tailscale IPv4: $ip"
          echo "  Janet API:      http://${ip}:8080"
          echo "  Janet WS:       ws://${ip}:8765"
          echo "  janet-peer:     ${ip}:9876 (default; ~/.config/janet-peer/config.toml)"
        else
          echo "No Tailscale IPv4 yet — complete login (tailscale up)."
        fi
      else
        echo "tailscale CLI not in PATH. macOS: open Tailscale from Applications. Linux: ensure tailscale package is installed."
      fi
      echo ""
      echo "Bind Janet on all interfaces on this host:"
      echo "  export JANET_API_HOST=0.0.0.0"
      echo ""
      echo "janet-peer: allow mesh peers — add CGNAT range to trusted_networks, e.g."
      echo '  network.trusted_networks = [ "192.168.0.0/16", "100.64.0.0/10" ]'
    BASH
    chmod "+x", bin/"janet-mesh-env"
  end

  def caveats
    <<~EOS
      This formula installs three layers (Ultimate / cluster-style mesh):
        • Janet — API, IDE awakening, Ollama (meta-formula `janet`)
        • janet-peer — P2P daemon (~/.config/janet-peer/config.toml)
        • Tailscale (Homebrew formula) — encrypted overlay; start with: brew services start tailscale && sudo tailscale up

      One-liner (after install):
        sudo tailscale up && mkdir -p ~/.config/janet-peer && janet-mesh-env

      Then on this Mac/host:
        export JANET_API_HOST=0.0.0.0
        janet-api-server    # :8080
        janet-peer          # :9876 (optional second terminal)

      Other nodes: use this host's Tailscale IP instead of LAN IP.
    EOS
  end

  test do
    assert_predicate Formula["MzxzD/janet/janet-peer"], :installed?
    assert_predicate Formula["MzxzD/janet/janet"], :installed?
    assert_match "Janet mesh", shell_output(bin/"janet-mesh-env")
  end
end
