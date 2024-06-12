#!/bin/sh
set -eux

which tbump
before=$(git rev-parse HEAD)
auto-changelog -v $VERSION
pre-commit run --files CHANGELOG.md || true
git add CHANGELOG.md
git commit -m "changelog for $VERSION"
tbump $VERSION
