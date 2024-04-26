#!/bin/sh

set -e

# build the project
rm -r public
npm run build

# commit changes
rm -r docs
mkdir -p docs
mv public/* docs/

cd docs
git add .

msg="deploying site $(date)"
git commit -m "$msg"

# push source to repo
git push origin master