# `pre-commit` template for your Python project

## How does it work?

`pre-commit` is a tool that runs hooks at every attempt to commit changes that have been made in
the repository. This project contains configuration files that makes it a useful tool to validate
Python code against the official style-guides.

## How to install it?

The project is configured as a bunch of files that will be integrated with your project from an
auxiliary remote. Once the configuration is completed, the remote can be used to update pre-commit.

1. Add this repo as an auxiliary remote of your project:
   ```bash
   git remote add pre-commit git@github.com:anty-filidor/template-python.git
   git fetch pre-commit
   git config pull.rebase false
   ```
2. Install `pre-commit` library and dependencies:
   ```bash
   pip install pre-commit pytest clang-format
   ```
3. Pull the fresh code (to start and for updates as well):
   ```bash
   git pull pre-commit origin --allow-unrelated-histories
   ```
4. Init hooks:
   ```bash
   pre-commit install --config .pre-commit-config.yaml
   ```

## How to work with it?

After the `pre-commit` is successfully installed you work just as before. The main difference is
that after each execution of the `git commit` command, several tools are going to be ran to check
the **staged code** and, in case of any shortcomings, the `commit` operation will be aborted.

Two most important ways to "hack" `pre-commit`:
- `git commit -m "message" --no-verify` -> code check will be skipped
- `pre-commit run --all-files` -> entire codebase will be checked, not only files staged in git
