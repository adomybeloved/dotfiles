{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bun
    nodejs_22
    pnpm
    yarn
    typescript

    python3
    uv
    ruff

    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer
    cargo-edit
    cargo-watch

    go
    gopls
    golangci-lint

    termius
    sshfs

    bruno
    sqlite

    gcc
    gnumake
    pkg-config
    cmake
    ninja

    jq
    yq-go
    httpie
  ];

  home.sessionVariables = {
    CARGO_HOME = "${config.home.homeDirectory}/.cargo";
    RUSTUP_HOME = "${config.home.homeDirectory}/.rustup";
    GOPATH = "${config.home.homeDirectory}/go";
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.cargo/bin"
    "${config.home.homeDirectory}/go/bin"
  ];
}
