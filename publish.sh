#! /bin/sh

set -e

if [ $# -ne 1 ] ; then
  echo "usage: $0 <new-version>"
  exit 1
fi

VERSION="${1}"

sed -e "s:VERSION.*:VERSION = '${VERSION}':" -i lib/hiera-backend-rspec/version.rb

bundle exec rake spec

git commit -m "prepare release ${VERSION}" lib/hiera-backend-rspec/version.rb

gem build "hiera-backend-rspec.gemspec"
git tag "${VERSION}"

echo "upload?"
read ok

gem push "hiera-backend-rspec-${VERSION}.gem"

echo "push?"
read ok

git push
git push --tags
