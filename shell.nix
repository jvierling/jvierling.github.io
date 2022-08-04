{ pkgs ? import <nixpkgs> {} } :
with pkgs;
let
  rubyEnv = bundlerEnv rec {
      name = "jekyll_env";
      inherit ruby;
      gemfile = ./Gemfile;
      lockfile = ./Gemfile.lock;
      gemset = ./gemset.nix;
    };
in
mkShell rec {
  name = "jvierling.github.io";
  nativeBuildInputs = [ jekyll rubyEnv bundler ];
  shellHook = ''
    bundle exec jekyll serve --watch
  '';
}
