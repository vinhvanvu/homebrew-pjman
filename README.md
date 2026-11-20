# homebrew-pjman

The Homebrew tap for [pjman](https://github.com/vinhvanvu/pjman).

**Every change, every decision, and why.**

pjman is an opinionated framework for product development and project management, built on a context graph your agents keep and you steer.

![The bridge on a busy afternoon: the day's writes on one timeline, and seven changes in motion grouped by what each needs from you: working now, stopped with the next step set, in review](https://raw.githubusercontent.com/vinhvanvu/pjman/main/assets/hero.png)

pjman gives the work a fixed shape: what the product is, each unit of work with where it came from and what done means, every choice with its options and who accepted it, and the sessions that did it. The agents read that shape at the start of every session and write to it through one command. You read it, steer it and make the decisions. The store under it is a git repository of Markdown files on your machine.

## Install

```bash
brew trust --formula vinhvanvu/pjman/pjman
brew install vinhvanvu/pjman/pjman
cd <your-repo> && pjman init
```

Homebrew brings its own Node. `pjman init` creates your store, registers the repository as a project, installs the Claude Code plugin when `claude` is on the PATH, and starts the dashboard. Then run `claude` in the repository: the session starts from the record. What `pjman init` prints and what the first session looks like are in the [Install](https://github.com/vinhvanvu/pjman#install) and [With Claude Code](https://github.com/vinhvanvu/pjman#with-claude-code) sections of pjman's README.

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
