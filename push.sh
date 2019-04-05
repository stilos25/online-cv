setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_pdf() {
  git checkout master
  git add cv.pdf
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote remove origin
  git remote add origin https://spirosbax:$GITHUB_TOKEN@github.com/spirosbax/cv.git
  git push --quiet -u origin master
}

setup_git
commit_pdf
upload_files
