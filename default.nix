{
  gmp,
  libssh2,
  crystal,
  fetchFromGitHub,
  git,
  shards,
  stdenv,
}:
crystal.buildCrystalPackage {
  pname = "bld";
  version = "1.0.21";

  src = fetchFromGitHub {
    owner = "buildio";
    repo = "cli";
    rev = "v1.0.21";
    hash = "sha256-eeusNzLhMAjqQVoxqwKPAoEVWRLcFWMXS0UZi+lhX4o=";
  };

  # Use `shards` instead of `make`
  format = "shards";
  shardsFile = ./shards.nix;

  buildInputs = [
    libssh2
    gmp
  ];

  crystalBinaries.bld = {
    src = "src/build_cli.cr";
    options = [
      "--release"
      "--production"
      "--no-debug"
      "--static"
    ];
  };
}
