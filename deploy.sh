#!/usr/bin/env sh

git add .
git commit -m $(date)
git subtree push --prefix assets origin gh-pages
