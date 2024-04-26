#!/bin/sh

set -e

# build the project
rm -r public
npm run build

# commit changes
rm -r dist
mkdir -p dist
mv public/* dist/

cd dist
git add .

msg="deploying site $(date)"
git commit -m "$msg"

# push source to repo
git push origin master