# Contributing to homebrew-janet

## Updating formulae

1. Edit the formula in `Formula/<name>.rb`
2. If the source URL changed, update `url` and `sha256`:
   ```bash
   curl -sL "https://github.com/MzxzD/Janet-Projects/archive/refs/heads/main.tar.gz" | shasum -a 256
   ```
3. Run audit: `brew audit MzxzD/janet/<formula> --strict`
4. Test install: `brew install MzxzD/janet/<formula> --build-from-source`

## Adding a new formula

1. Create `Formula/<name>.rb` following Homebrew conventions
2. Add to README and docs
3. Run `brew audit --new-formula MzxzD/janet/<name>`

## Bottles (pre-built binaries)

To add bottles and avoid source builds:

1. Add `.github/workflows/build.yml` to build on macOS runners
2. Build bottles with `brew build --bottle <formula>`
3. Upload to GitHub Releases
4. Add `bottle do` block to formula with `url` and `sha256` per platform

See [Homebrew bottling docs](https://docs.brew.sh/Bottles).
