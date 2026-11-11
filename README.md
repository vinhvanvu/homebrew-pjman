# homebrew-pjman

The Homebrew tap for [pjman](https://github.com/vinhvanvu/pjman): the record of a software product, kept in git by the agents that build it.

![The bridge on a busy afternoon: the day's writes on one timeline, and the changes in motion grouped by what each needs from you](https://raw.githubusercontent.com/vinhvanvu/pjman/main/assets/hero.png)

Changes, decisions, the product map and agent sessions are records in one git store. Coding agents read the record at the start of every session and write back through one command; you read it on a dashboard and make the decisions. Works best in [cmux](https://cmux.com) and [Rex](https://www.superlogical.com), where the dashboard docks beside the session.

## Install

```bash
brew trust --formula vinhvanvu/pjman/pjman
brew install vinhvanvu/pjman/pjman
cd <your-repo> && pjman init
```

Homebrew brings its own Node. `pjman init` creates your store, registers the repository as a project, installs the Claude Code plugin when `claude` is on the PATH, and starts the dashboard. Then run `claude` in the repository: the session starts from the record. What you should see at each step is in the [Getting started](https://github.com/vinhvanvu/pjman#getting-started) section of pjman's README.

## Upgrade

```bash
brew upgrade pjman
```

The Claude Code plugin follows the upgrade at the next session. Run `pjman migrate` when pjman asks for it.

## When something is off

```bash
pjman doctor
```

It checks the install without changing anything and names the command that fixes each problem. The usual ones (Homebrew refusing the tap, an npm copy of pjman shadowing this one, outdated Command Line Tools) are in [Installing pjman](https://github.com/vinhvanvu/pjman/blob/main/docs/install.md).

## The formula

`Formula/pjman.rb` is written by pjman's release from the package it published to npm (`@vinhvanvu/pjman`). It is never edited by hand: the next release overwrites it.
