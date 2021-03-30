#!/bin/sh
set -e

bumpversion release --tag
bumpversion patch
git push --follow-tags
