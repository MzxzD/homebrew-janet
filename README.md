# Homebrew Janet

Homebrew tap for the [Janet AI ecosystem](https://github.com/MzxzD/Janet-Projects) - voice-first, offline, constitutional AI.

## Installation

Tap and install:

```bash
brew tap MzxzD/janet
brew install MzxzD/janet/janet
```

Or install individual components:

```bash
brew tap MzxzD/janet
brew install MzxzD/janet/janet-seed      # Janet AI core
brew install MzxzD/janet/janet-peer       # P2P mesh daemon
brew install MzxzD/janet/janet-arm64-toolchain  # ARM64 assembler
```

## Formulae

| Formula | Description |
|---------|-------------|
| `janet` | Meta-formula: installs janet-seed + optional janet-peer, janet-arm64-toolchain |
| `janet-seed` | Janet AI core - constitutional, offline-first AI companion |
| `janet-peer` | Peer-to-peer mesh network daemon for Janet ecosystem |
| `janet-arm64-toolchain` | ARM64 assembler for Apple Silicon (janet-as) |

## Quick start

```bash
# Install full stack
brew install MzxzD/janet/janet

# Start Janet API server
janet-api-server

# Or start Janet core (WebSocket)
janet-core
```

## Documentation

- [Janet-Projects](https://github.com/MzxzD/Janet-Projects)
- [JanetOS](https://github.com/MzxzD/Janet-Projects/tree/main/JanetOS)
