# Install Optimization Guide

## janet-seed: Fast vs Full Install

janet-seed supports two install modes:

### Default: Minimal (Fast ~1-2 min)

Installs only core dependencies needed for:
- janet-api-server (IDE integration, Ollama)
- janet-core (WebSocket, constitutional AI)
- LiteLLM routing
- Home Assistant API

**Excludes:** ChromaDB, Whisper, PyTorch, voice features, learning/fine-tuning.

```bash
brew install MzxzD/janet/janet-seed
```

### Full: Voice + ChromaDB + Learning (~10-20 min)

Installs all dependencies including:
- Voice (Whisper STT, TTS)
- ChromaDB (semantic memory)
- PyTorch, transformers (learning/fine-tuning)

```bash
brew install MzxzD/janet/janet-seed --with-full
```

**Recommendation:** Start with the default. Add full deps later if needed:

```bash
# After minimal install, add voice/memory via pip in the venv
$(brew --prefix janet-seed)/libexec/bin/pip install chromadb openai-whisper sounddevice pyttsx3
```

## janet-peer and janet-arm64-toolchain: Build from Source

Both are Rust projects. First install is ~2-5 min (cargo build). Subsequent upgrades are similar.

**Tip:** Ensure you have a recent Rust toolchain. Homebrew fetches it automatically.

## Bottles (Future)

Pre-built bottles (binary packages) would eliminate build time. Requires GitHub Actions to build and upload. See CONTRIBUTING.md for bottle workflow setup.
