git remote add prelude https://github.com/bbatsov/prelude.git
git fetch prelude
git checkout -b prelude prelude/master
git checkout master
git rebase prelude
git branch -d prelude
