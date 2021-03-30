#!/bin/sh
set -eu

before=$(git rev-parse HEAD)
auto-changelog -v $VERSION
pre-commit run --files CHANGELOG.md || true
git add CHANGELOG.md
git commit -m "changelog for $VERSION"
bump2version release --tag --commit --new-version $VERSION
bump2version patch
git diff $before $VERSION
echo "git push --follow-tags"
