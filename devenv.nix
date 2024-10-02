{ pkgs, lib, config, inputs, ... }:

{
  cachix.enable = false;
  env.NIX_ENFORCE_PURITY = 0;
  env.NIX_SHELL_PRESERVE_PROMPT = 1;
  env.NIXPKGS_ALLOW_UNFREE = 1;

  packages = [

  ];

  languages.python = {
    enable = true;
    version = "3.11";
    uv.enable = true;
  };

  enterShell = ''
    echo "~~~ tttm-randy ~~~"
    uv venv && \
      source .venv/bin/activate && \
      uv pip install -r requirements.txt
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
  '';
}
