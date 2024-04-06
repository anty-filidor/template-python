# Template with `pre-commit` configuration for your Python project!

## How does it work?

`pre-commit` is a tool that runs so-called hooks at every attempt to commit
changes that have been made in the repository. This project contains such
configuration files, that makes from it a useful tool to validate Python code
against official style guides.

## How to install it?

In order to use this repo you need to be familiar with concept of
[git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules).

1. Add this repo as a submodule to your project:
   `git submodule add git@github.com:anty-filidor/template-python.git template-python`
2. Integrate contents of `.gitignore` defined in the `pre-commit-template` with
   your project (optional):
   `git config core.excludesFile template-python/.gitignore`
3. Install `pre-commit` library: `pip install pre-commit pylint_django clang-format`
4. Init hooks:
   `pre-commit install --config template-python/.pre-commit-config.yaml`
5. To update the `pre-commit` configuration type:
   `git submodule update --remote --merge` (that command updates all submodules
   added to the project)

## How to work with it?

After the `pre-commit` is successfully installed you can basically work just as
before. The main difference you will notice is that after you execute
`git commit` command, several tools will be ran to check your code and, in
case of detection of issues, the "commit" operation will be aborted. There is
also one issue worth of noting: conflict of `pre-commit` with GUI tools for
Git. They just don't like themselves, so that you will be able to use only CLI
for committing your changes in the codebase. The last important thing is a
possibility to skip code validation. In case of need to quickly save your work
and push it to the GitLab you can skip `pre-commit` execution by adding flag
`--no-verify` at the very end of the `git commit` command. Remember to add
`WIP:` prefix to the commit name then.

## Pre-commit vs linters in your IDE

Of course, it's possible, but why? Pre-commit will do its job regardless your 
local IDE configuration... Anyway, if you're so determined, then here is a
trick: create symbolic links to (or just copy) configuration files of the hooks. 
This will provide at least a bit of consistency between your IDE and pre-commit
(for instance it's hardly probable the version of black you have will be the 
same as in the `yaml` file).
