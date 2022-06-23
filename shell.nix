with import <nixpkgs> {};

mkShell {
  buildInputs = [
    pre-commit
    shellcheck
    terraform-docs
    terraform-ls
    tflint
  ];
}
