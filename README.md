# Homebrew Janet

Homebrew tap for the [Janet AI ecosystem](https://github.com/MzxzD/Janet-Projects) — voice-first, offline, constitutional AI.

## Install (one-liner)

```bash
brew tap MzxzD/janet
brew install MzxzD/janet/janet
```

## Formulae

| Formula | Description |
|---------|-------------|
| `janet` | Meta-formula: janet-seed + optional janet-peer, janet-arm64-toolchain |
| `janet-seed` | Janet AI core (API server, Ollama, constitutional AI) |
| `janet-peer` | P2P mesh daemon |
| `janet-arm64-toolchain` | ARM64 assembler (`janet-as`) |

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

# Or start Janet core (WebSocket)
janet-core
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
- [JanetOS](https://github.com/MzxzD/Janet-Projects/tree/main/JanetOS)
