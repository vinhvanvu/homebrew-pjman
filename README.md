# homebrew-pjman

The Homebrew tap for [pjman](https://github.com/vinhvanvu/pjman).

**Every change, every decision, and why.**

pjman keeps a record of your product work in a store: Markdown files in a git repository on your machine. The records link to each other, so the store is a graph. It holds the product map, each change with where it came from and what done means, every decision with its options and who accepted it, the sessions that did the work, the files of code each capability is built from, and the people: the accounts they hold and their stakes in the map. Before you tag someone on a pull request, `pjman people` names who has a stake in what it changes. Your agent reads the store at the start of each session and writes to it through the `pjman` command, so a new session starts from what earlier ones recorded. A local dashboard draws the same files.

## Install

```bash
brew trust --formula vinhvanvu/pjman/pjman
brew install vinhvanvu/pjman/pjman
cd <your-repo> && pjman init
```

Homebrew brings its own Node. `pjman init` creates your store, registers the repository as a project, installs the Claude Code plugin when `claude` is on the PATH, and starts the dashboard. What init asks and what the first session does are in [Set up a repository](https://github.com/vinhvanvu/pjman#set-up-a-repository) in pjman's README.

In [cmux](https://cmux.com) the dashboard docks in a pane beside the session and follows it. In Claude Code's desktop app a follow window does the same. In any other terminal, `pjman open` brings the session's page up in your browser.

## Upgrade

```bash
brew upgrade pjman
```

The Claude Code plugin follows the upgrade at the next session. When the new version changes how the store is laid out, pjman says so: run `pjman migrate` until it reports nothing to migrate.

## When something is off

```bash
pjman doctor
```

It checks the install without changing anything and names the command that fixes each problem. The usual ones (Homebrew refusing the tap, an npm copy of pjman shadowing this one, outdated Command Line Tools) are in [Installing pjman](https://github.com/vinhvanvu/pjman/blob/main/docs/install.md).

## The formula

`Formula/pjman.rb` is written by pjman's release from the package it published to npm (`@vinhvanvu/pjman`). It is never edited by hand: the next release overwrites it.
