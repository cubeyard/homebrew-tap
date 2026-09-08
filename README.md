# Cube Homebrew tap

Install [Cube](https://github.com/cubeyard/cube) on macOS (Apple Silicon or Intel):

```sh
brew install cubeyard/tap/cube
cube up
```

Homebrew installs the launcher and QEMU. The first `cube up` downloads the
VM images (~1.1 GB); Node, Docker and the agent runtime stay inside the VM.

## Updates

```sh
brew upgrade cube  # launcher
cube upgrade       # VM and application
```

## Uninstall

```sh
cube down
brew uninstall cube
```

This keeps VM data in `~/.cube`. To delete the VM and all its data, run
`cube destroy --yes` before uninstalling instead.

## Maintaining the formula

`Formula/cube.rb` is generated from a stable Cube release's launcher asset
by `scripts/homebrew-formula.ts` in the Cube repository. Never use a moving
`latest` URL: the release version and SHA-256 must identify the same bytes.
See [Homebrew publishing](https://github.com/cubeyard/cube/blob/main/DEVELOPING.md#homebrew-publishing)
for the optional automated release setup.
