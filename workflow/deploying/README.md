
# Deploying

How to deploy to desiringgod.org's production server.


## Remember
  - In-case there is a problem with the release, you can always rollback to the previous version.
    Use:

    ```
    heroku rollback
    ```

    More information [here](https://devcenter.heroku.com/articles/releases#rollback).

  - Communicate with the team your intentions to release.

  - Ask a team member for help if you need it.


## Preconditions

If you need to run scripts as a part of your release:
  * You should have authorization for the app repository to the production app.
  * You should have the [heroku toolbelt](https://toolbelt.heroku.com/) installed and configured locally.


## Deploy Process

1. Get a sign-off on your code changes from your code reviewer.

1. Make sure no one else is currently deploying.

1. Announce the intention to deploy to the team.

1. Rebase your branch against the latest master.

1. QA your branch thoroughly on a review app.

1. IF NEEDED: Execute any pre-deploy tasks.

1. Giving yourself enough room for supporting the release (give yourself a few hours after the deploy), **merge
  your branch** into remote master.

  This will:

  - Trigger a CI build. (Rebuild CI to fix spurious failures. Submit PR to fix bugs.)

  - Trigger a deploy once CI build passes.

  **WARNING: It is presently undefined what should happen if something new gets merged into master at this point.**

1.  Immediately upon deploy, view your changes in production. If something doesn't look right, alert the rest of the
    team and we'll work with you to figure out a fix. Possible fixes include clearing the cache, restarting heroku,
    running a script you forgot, or even writing and deploying new code.

    To run scripts use:

    ```
    heroku run rake run_script number=xxxxx --app <app-name>
    ```

    To clear the cache use:

    ```
    heroku run rails runner Rails.cache.clear --app <app-name>
    ```

    To restart heroku use:

    ```
    $ heroku restart --app <app-name>
    ```

1. Announce the deploy to the team.
