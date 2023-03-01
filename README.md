# The Primordia Nebulous Blank

> The essence of creativity is the birth of stars deep in a rainbow haze. Our minds, nebulous in intent and action, compact the starry sky into what may be a future star.

In other words, this is a template to make amazing projects or other templates.

## Background

All projects using this will be using [nix](https://nixos.org/) with `flakes` enabled to manage dependencies. You should be entering a shell that has everything you need with platform-independent defaults.

I use [nix-direnv](https://github.com/nix-community/nix-direnv) as a way to autoload the nix-shell.

All other dependencies and defaults are described in the `flake.nix`.

## Getting Started

Make sure [nix-direnv](https://github.com/nix-community/nix-direnv) is installed and run:

```shell
direnv allow
```

> **Note**
>
> [direnv](https://direnv.net/docs/installation.html) will also need to be installed so that `nix-direnv` works.

### Environment Variables

Environment variables are stored in a `.env` file, but will not be bundled with the repository. You can customize the `defaults.env` to `.env` to build off the default environment variable file.

### App Folder

This is where your source code and assets for the project should go. The repository root is intended for environment or external configuration.
