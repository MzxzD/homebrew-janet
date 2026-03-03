# Homebrew Janet - Documentation Index

Complete documentation for the Janet ecosystem Homebrew tap.

## Quick Links

| Document | Description |
|----------|-------------|
| [../README.md](../README.md) | Overview, install commands |
| [OPTIMIZATION.md](OPTIMIZATION.md) | Fast vs full install, bottles |
| [FORMULAE.md](FORMULAE.md) | Formula reference, options, source URLs |
| [TROUBLESHOOTING.md](TROUBLESHOOTING.md) | Common issues and fixes |

## Install Flow

```
brew tap MzxzD/janet
    │
    ├── brew install MzxzD/janet/janet          # Full stack (janet-seed + optional)
    ├── brew install MzxzD/janet/janet-seed     # Core only (minimal, fast)
    ├── brew install MzxzD/janet/janet-peer     # P2P daemon
    └── brew install MzxzD/janet/janet-arm64-toolchain  # ARM64 assembler
```

## janet-seed Variants

| Variant | Command | Install Time | Includes |
|---------|---------|--------------|----------|
| Minimal (default) | `brew install MzxzD/janet/janet-seed` | ~1-2 min | API, Ollama, LiteLLM |
| Full | `brew install MzxzD/janet/janet-seed --with-full` | ~10-20 min | + Voice, ChromaDB, PyTorch |

## Repositories

- **Tap:** https://github.com/MzxzD/homebrew-janet
- **Source:** https://github.com/MzxzD/Janet-Projects
- **JanetOS:** https://github.com/MzxzD/Janet-Projects/tree/main/JanetOS
