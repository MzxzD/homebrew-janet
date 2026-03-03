# Troubleshooting

## janet-seed

### ImportError: No module named 'chromadb'

You installed the minimal (default) variant. ChromaDB is optional. Either:
- Reinstall with `--with-full`, or
- Run: `$(brew --prefix janet-seed)/libexec/bin/pip install chromadb`

### ImportError: No module named 'whisper'

Voice features require `--with-full`. To add voice:
```bash
$(brew --prefix janet-seed)/libexec/bin/pip install openai-whisper sounddevice pyttsx3
```

### janet-api-server fails to connect to Ollama

1. Install Ollama: `brew install ollama`
2. Start Ollama: `ollama serve` (or launch Ollama app)
3. Pull a model: `ollama pull qwen2.5-coder:7b`

### Permission denied on libexec

Ensure the formula completed. Run:
```bash
brew reinstall MzxzD/janet/janet-seed
```

---

## janet-peer / janet-arm64-toolchain

### cargo build fails

1. Update Rust: `brew upgrade rust`
2. Check Xcode CLI: `xcode-select --install`
3. Build from source with verbose: `brew install MzxzD/janet/janet-peer -v`

### SHA256 mismatch

The Janet-Projects repo was updated. Update the tap:
```bash
brew update
brew upgrade MzxzD/janet/janet-peer
```

---

## Tap

### Formula not found

Ensure the tap is added:
```bash
brew tap MzxzD/janet
brew tap  # list taps
```

### Tap fails to update

```bash
brew untap MzxzD/janet
brew tap MzxzD/janet
```

### Audit failures

Run audit locally:
```bash
brew audit MzxzD/janet/janet-seed --strict
```
