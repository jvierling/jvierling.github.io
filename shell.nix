{ pkgs ? import <nixpkgs> {} } :
with pkgs;
mkShell rec {
  name = "jvierling.github.io";
  nativeBuildInputs = [
    pkgs.ruby_3_1      # Match the Ruby version used by GitHub Pages
    pkgs.bundler
    pkgs.zlib
    pkgs.libffi
    pkgs.libxml2
    pkgs.libxslt
    pkgs.pkg-config
    pkgs.git           # Sometimes needed by Bundler
  ];
  shellHook = ''
    bundle install
    bundle exec jekyll serve --watch
  '';
}
