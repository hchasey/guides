
# Deploying

How to deploy to desiringgod.org's production server.

## Preconditions

* You should have authorization for the app repository and the staging and production heroku apps.
* You should have the production heroku app added as a git remote called `production`.
* You should have the [heroku toolbelt](https://toolbelt.heroku.com/) installed and configured locally.

## Deploy Process

### Pre-Deploy QA

1. Make sure master build is passing. 

1. Sync local master branch:

  ```
  $ git fetch
  $ git checkout master 
  $ git pull origin master 
  ```

1. Bootstrap staging.

  ```
  $ bin/rake db:bootstrap_staging
  ```

1. Execute any pre-deploy tasks on staging.

1. Deploy to staging:

  **NOTE: This will migrate the database for you as well.**

  ```
  $ git checkout master
  $ bin/rake deploy:staging
  ```

1. Execute any post-deploy tasks on staging.

1. Announce to the team that a deploy is staged for review and ask team to do QA.

1. Make any changes needed as new PRs, re-deploying to staging as necessary.

  **WARNING: It is presently undefined what should happen if something new gets merged into master at this point. Most likely, that should cause the QA process to restart.**

1. Pull fully-QA'd master branch:

  ```
  $ git fetch
  $ git checkout master
  $ git pull origin master
  ```

### Documentation

1. [Create tag and release notes on github](https://github.com/desiringgod/desiring-god-new/releases), following the established pattern (Pull Requests, Pre-deploy actions, Post-deploy actions), pasting in PR titles and numbers as patterned.

### Deployment

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
  $ heroku restart --app <app-name>
  ```

1. Announce the deploy to the team, sharing a link to the release notes.
