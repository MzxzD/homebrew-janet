# Janet Install (public)

**Public Homebrew tap for Janet-seed.** No private repos required.

## Install (macOS / Linux with Homebrew)

```bash
brew tap MzxzD/janet
brew install janet-all
```

Then:

- **Start API:** `janet-server` (default http://localhost:8080)
- **Menu bar (macOS):** `janet-menubar`

## From source (this repo)

If you clone this repo and want to install the formula from the local file:

1. Create a tap that points at this repo, or
2. Copy `Formula/janet-all.rb` into your tap’s Formula dir, then `brew install janet-all`

Standard tap name: **homebrew-janet** so that `brew tap MzxzD/janet` works (repo URL: `https://github.com/MzxzD/homebrew-janet`).

## Make this repo public on GitHub

1. Create a new repo on GitHub: **MzxzD/homebrew-janet** (or your org/user).
2. Set visibility to **Public**.
3. Push this folder:

   ```bash
   cd /path/to/janet-install-public
   git init
   git add .
   git commit -m "Add janet-all formula (public Janet-seed)"
   git remote add origin https://github.com/MzxzD/homebrew-janet.git
   git push -u origin main
   ```

4. Anyone can then run: `brew tap MzxzD/janet` and `brew install janet-all`.

## Formula details

- **Source:** [MzxzD/Janet-seed](https://github.com/MzxzD/Janet-seed) (public).
- Uses `requirements-core.txt` for a lighter install; falls back to `requirements.txt` if needed.
- Optional: `ollama` (recommended) for local LLM.
