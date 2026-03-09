# Formula Reference

## janet (meta-formula)

**Installs:** janet-seed (required), ollama (recommended), janet-peer (optional), janet-arm64-toolchain (optional)

```bash
brew install MzxzD/janet/janet
```

| Dependency | Default | Notes |
|------------|---------|-------|
| janet-seed | required | Core AI |
| ollama | recommended | Local LLM backend |
| janet-peer | optional | P2P mesh |
| janet-arm64-toolchain | optional | ARM64 assembler |

---

## janet-seed

**Description:** Janet AI core - constitutional, offline-first AI companion

**Binaries:** `janet-api-server`, `janet-core`

**Options:**
- `--with-full` — Install voice, ChromaDB, learning deps (slower)

```bash
# Minimal (fast)
brew install MzxzD/janet/janet-seed

# Full
brew install MzxzD/janet/janet-seed --with-full
```

**Recommended deps:** ollama, portaudio (for voice with --with-full)

---

## janet-peer

**Description:** P2P mesh network daemon for Janet ecosystem

**Binary:** `janet-peer`

**Build:** From source (Rust)

```bash
brew install MzxzD/janet/janet-peer
```

---

## janet-arm64-toolchain

**Description:** ARM64 assembler for Apple Silicon (janet-as)

**Binary:** `janet-as`

**Build:** From source (Rust)

```bash
brew install MzxzD/janet/janet-arm64-toolchain
```

---

## janetxapple-passwords-fusion

**Description:** Keychain credential Double Soul for Janet — unified credentials for janet-max, PinchTab, Cursor. Soul Check = OS Keychain prompt (Axiom 10).

**Binary:** `janetxapple`

**Build:** From source (Python, pip install)

```bash
brew install MzxzD/janet/janetxapple-passwords-fusion
```

**Verify:** `janetxapple --version` prints semantic version.

---

## Source URLs

All formulae fetch from:
- `https://github.com/MzxzD/Janet-Projects/archive/refs/heads/main.tar.gz`

Archive structure:
- `Janet-Projects-main/janet-peer/`
- `Janet-Projects-main/janet-arm64-toolchain/`
- `Janet-Projects-main/JanetOS/janet-seed/`
- `Janet-Projects-main/JanetXApple-Passwords-Fusion/`
