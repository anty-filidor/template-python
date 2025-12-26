# `pre-commit` template for your Python project

`pre-commit` is a tool that runs hooks on every attempt to commit changes made in a repository.
This project contains configuration files that make it a useful tool for validating Python code
against official style guides.

## How to install it?

The project is configured as a set of files that can be integrated into your project from an
auxiliary remote. Once the configuration is complete, the remote can be used to update
`pre-commit`.

1. Add this repository as an auxiliary remote to your project:
   ```bash
   git remote add pre-commit git@github.com:anty-filidor/template-python.git
   git fetch pre-commit
   git config pull.rebase false
   ```
2. Install `pre-commit` library and dependencies:
   ```bash
   pip install pre-commit pytest clang-format
   ```
3. Pull the initial code (and use this command for future updates as well):
   ```bash
   git pull pre-commit master --allow-unrelated-histories
   ```
4. Initialise the hooks:
   ```bash
   pre-commit install --config .pre-commit-config.yaml
   ```

## How does it work?

After `pre-commit` has been successfully installed, you can work as before. The main difference is
that, after each execution of the `git commit` command, several tools are run to check the
staged code and, if any issues are detected, the `commit` operation is aborted.

The two most important ways to “hack” `pre-commit` are:
- `git commit -m "message" --no-verify`: code checks are skipped;
- `pre-commit run --all-files`: the entire codebase is checked, not only the staged files.

## How to develop this project?

Below is a set of guidelines to avoid issues when using the tool in third-party repositories:
- maintain a linear commit history (no merge commits);
- tag each release as `pc<major>.<minor>.<patch>`, e.g. `pc0.2.1`;
- keep this repository minimal, as it is intended to be merged into “real” projects.
