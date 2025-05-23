# Updating

Change the revision & hash in [default.nix](default.nix)

If dependencies have changed, update `shards.nix` via `crystal2nix`
```sh
cp bld_src/shards.lock .
nix shell nixpkgs#crystal2nix --command crystal2nix
```

# Building & Testing

```sh
nix build .#
result/bin/bld
```
