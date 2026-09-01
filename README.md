# storagetax/homebrew-tap

The Homebrew tap for `stxctl`.

```sh
brew tap storagetax/tap
brew install stxctl
```

`Formula/stxctl.rb` is written by the release workflow in the private monorepo. Do not hand-edit it —
its `sha256` values are copied out of the release's signed `checksums.txt` rather than recomputed, so
an edit here silently breaks the one place those digests are checked against a signature.

A formula, not a cask, deliberately: Homebrew does not quarantine a formula's artifact, so `stxctl`
installs without a Gatekeeper prompt, and a formula works on Homebrew-on-Linux too.
