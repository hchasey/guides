
# Deploying

How to deploy to desiringgod.org's production server.

## Preconditions

* You should have authorization for the app repository and the staging and production heroku apps.
* You should have the production heroku app added as a git remote called `production`.
* You should have [git-flow](https://github.com/nvie/gitflow) installed and initalized locally.
* You should have the [heroku toolbelt](https://toolbelt.heroku.com/) installed and configured locally.

## Deploy Process

1. Make sure develop build is passing. 

1. Sync local master and develop branches:

  ```
  $ git fetch
  $ git checkout master 
  $ git pull origin master 
  $ git checkout develop 
  $ git pull origin develop 
  ```

1. Create a release branch (see [Releases](https://github.com/desiringgod/desiring-god-new/releases) and choose the correct version number):

  **NOTE: Always start release branches from develop.**

  ```
  $ git checkout develop
  $ git flow release start <version-number>
  ```

1. Push the release branch to github:

  ```
  $ git push origin release/<version-number>
  ```

1. Create a pull request on github **against master** using a link like this:

  ```
  https://github.com/desiringgod/desiring-god-new/compare/master...release/<version-number>
  ```

1. Deploy that release branch to staging (you can use the Manual Deploy Web Interface on the heroku app).

1. Announce to the team that a deploy branch is staged for review and ask team to do QA.

1. Make any changes needed directly on the release branch, re-deploying to staging as necessary.

1. Pull fully-QA'd release branch and re-pull develop to get latest updates:

  ```
  $ git fetch
  $ git checkout develop
  $ git pull origin develop
  $ git checkout release/<version-number>
  $ git pull origin release/<version-number>
  ```

1. 'Finish' the release branch (i.e. mainly merge the branch in develop and master):

  ```
  $ git flow release finish <version-number>
  ```

  When prompted for tag notes, paste in, line by line, PR titles and numbers. Example:

  ```
  Move worker queue configuration into env vars #1763
  Move Share to resource utility bar #1751
  ```

  Verify that the branch has been properly merged into both master and develop.

1. Push master, develop, and tags to the repository:

  **NOTE: Push master first so that it runs through CI first.**

  ```
  $ git checkout master
  $ git push origin master
  $ git push --tags
  $ git checkout develop
  $ git push origin develop
  ```

1. While you wait for master to pass on CI, [create release notes on github](https://github.com/desiringgod/desiring-god-new/releases), following the established pattern (Pull Requests, Pre-deploy actions, Post-deploy actions).

1. Execute any pre-deploy tasks, logging results in the release notes.

1. Deploy to production:

  **NOTE: This will migrate the database for you as well.**

  ```
  $ git checkout master
  $ bin/rake deploy:production
  ```

1. Execute any post-deploy tasks, logging results in the release notes.

1. OPTIONAL: Clear the cache:

  ```
  heroku run rails runner Rails.cache.clear --app <app-name>
  ```
  
1. OPTIONAL: Restart heroku:

  ```
  $ heroku restart
  ```

1. Close the release PR and delete the release github branch.

1. Announce the deploy to the team, sharing a link to the release notes.
