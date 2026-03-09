# Architecture

## Tap structure

```
homebrew-janet/
├── Formula/
│   ├── janet.rb              # Meta-formula
│   ├── janet-seed.rb         # Python (virtualenv)
│   ├── janet-peer.rb         # Rust
│   ├── janet-arm64-toolchain.rb  # Rust workspace
│   └── janetxapple-passwords-fusion.rb  # Python (pip install)
├── docs/
│   ├── DOCUMENTATION_INDEX.md
│   ├── OPTIMIZATION.md
│   ├── FORMULAE.md
│   ├── TROUBLESHOOTING.md
│   ├── CONTRIBUTING.md
│   └── ARCHITECTURE.md
├── .github/workflows/
│   └── audit.yml
└── README.md
```

## Source layout

All formulae fetch from `Janet-Projects`:

```
Janet-Projects-main/
├── janet-peer/           → janet-peer formula
├── janet-arm64-toolchain/
│   └── crates/assembler/ → janet-arm64-toolchain formula
├── JanetOS/
│   └── janet-seed/
│       ├── requirements.txt      → --with-full
│       └── requirements-core.txt → default
└── JanetXApple-Passwords-Fusion/  → janetxapple-passwords-fusion formula
```

## janet-seed install flow

1. Download Janet-Projects tarball
2. Create Python virtualenv in libexec
3. `pip install -r requirements-core.txt` (or requirements.txt with --with-full)
4. Copy janet-seed source to libexec/janet-seed
5. Create wrapper scripts: janet-api-server, janet-core
