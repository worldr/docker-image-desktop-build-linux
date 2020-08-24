# Docker image Linux.

## Description

Docker image for Linux builds.

+ Based of `golang/1.15-buster`.
+ Contains:

  + jq
  + git
  + openssl
  + openssh, server and client
  + flutter
  + hover-shim

## Release

The Way Of Gitops tells us *this should be a GitHub action…* And we are: just
create a tag with `bump2version` and GitHub action will kick in, build the
image, and push it. You need do nothing else.

```bash
python -m pip install -U bump2version   # if needed.
bump2version --verbose --dry-run patch  # Updated the patch version.
bump2version --verbose --dry-run minor  # Updated the minor version.
bump2version --verbose --dry-run major  # Updated the major version.
```

Remove the `--dry-run` to actually do it.

## Pre-commit

This repository supports [pre-commit
hooks](https://pre-commit.com/hooks.html). To enable, just run:

```bash
python -m pip install -U pre-commit  # if needed.
pre-commit install
```
