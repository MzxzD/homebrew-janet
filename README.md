# Homebrew Janet

Homebrew tap for the [Janet AI ecosystem](https://github.com/MzxzD/Janet-Projects) — voice-first, offline, constitutional AI.

## Install (one-liner)

```bash
brew tap MzxzD/janet
brew install MzxzD/janet/janet
```

**Mesh bundle (Janet Ultimate–style: full Janet + `janet-peer` + Tailscale overlay):**

```bash
brew tap MzxzD/janet && brew install MzxzD/janet/janet-mesh
```

Then: `tailscale up`, run `janet-mesh-env` for IPs and hints, `export JANET_API_HOST=0.0.0.0 && janet-api-server`.

**Or install janet-all only (public [Janet-seed](https://github.com/MzxzD/Janet-seed), no private repos):**

```bash
brew tap MzxzD/janet
brew install MzxzD/janet/janet-all
```

Then: `janet-server` (API on :8080), `janet-menubar` (macOS).

## Formulae

| Formula | Description |
|---------|-------------|
| `janet` | Meta-formula: janet-seed + janet-awakening + optional janet-peer, janet-arm64-toolchain |
| `janet-all` | **Public:** janet-seed from [MzxzD/Janet-seed](https://github.com/MzxzD/Janet-seed) — API server + menu bar (requirements-core) |
| `janet-seed` | **Public** [Janet-seed](https://github.com/MzxzD/Janet-seed) — `janet-api-server`, `janet-core` (same source as `janet-all`) |
| `janet-awakening` | IDE integration (Continue.dev + deepseek-coder:6.7b default) |
| `janet-peer` | P2P mesh daemon |
| `janet-mesh` | Meta: `janet` + `janet-peer` + Tailscale — cluster-style mesh (see `janet-mesh-env`) |
| `janet-arm64-toolchain` | ARM64 assembler (`janet-as`) |
| `janetxapple-passwords-fusion` | Keychain credential Double Soul (`janetxapple`) |
| `janet-portable-xrdesk` | [Janet Portable](https://github.com/MzxzD/janet-portable-xrdesk) launcher + **JanetXRDesk** share (RustDesk OSS sidecar docs); depends on `janet-all` |

**Portable + RustDesk bundle:**

```bash
brew tap MzxzD/janet
brew install MzxzD/janet/janet-portable-xrdesk
janet-portable
```

## janet-seed: Fast vs Full

**Default (minimal, ~1–2 min):** Core only — API, Ollama, LiteLLM. No voice/ChromaDB/PyTorch.

```bash
brew install MzxzD/janet/janet-seed
```

**Full (~10–20 min):** Voice, ChromaDB, learning/fine-tuning.

```bash
brew install MzxzD/janet/janet-seed --with-full
```

See [docs/OPTIMIZATION.md](docs/OPTIMIZATION.md) for details.

## Quick Start

```bash
# Install
brew tap MzxzD/janet
brew install MzxzD/janet/janet

# Start Janet API server
janet-api-server

# Or for IDE (Continue.dev) with deepseek-coder:6.7b
janet-awakening-setup   # first time: creates ~/.continue/config.json
janet-awakening        # start server for Cursor/VS Code

# Or start Janet core (WebSocket)
janet-core
```

**Or with janet-all only (public Janet-seed):**

```bash
brew tap MzxzD/janet
brew install MzxzD/janet/janet-all
janet-server   # API on http://localhost:8080
```

## Documentation

| Document | Description |
|----------|-------------|
| [docs/DOCUMENTATION_INDEX.md](docs/DOCUMENTATION_INDEX.md) | Documentation index |
| [docs/OPTIMIZATION.md](docs/OPTIMIZATION.md) | Install optimization |
| [docs/FORMULAE.md](docs/FORMULAE.md) | Formula reference |
| [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) | Troubleshooting |

## Links

- [Janet-Projects](https://github.com/MzxzD/Janet-Projects)
- [Janet-seed (public)](https://github.com/MzxzD/Janet-seed)
- [JanetOS](https://github.com/MzxzD/Janet-Projects/tree/main/JanetOS)
