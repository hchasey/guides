
# Branching with Multiple Developers

How to handle branching when multiple developers are involved.

## Preconditions

* Choose one developer to be the **owner** of the branch. The owner will usually be a backend developer.

## Owner Responsibilities

* Create the branch, even if another developer will be making the first commits.

  ```
  $ git checkout -b feature/your-new-feature
  $ git push origin feature/your-new-feature
  ```

* Keep the branch rebased against master.

* Review and accept pull requests made by other developers against the branch.

* Shepherd the branch through its final code review and merge.

## How To Work On Somebody Else's Branch

1. Create a new branch off of the owner's branch, appending something relevant (such as your initials, a subfeature name, or "-fed"/"-bed") to create a new branch name.

   ```
   $ git checkout origin/feature/your-new-feature
   $ git checkout -b feature/your-new-feature-fed
   ```

1. Rebase regularly against the owner's branch to keep up with the latest changes.

   ```
   $ git fetch
   $ git checkout feature/your-new-feature-fed
   $ git rebase origin/feature/your-new-feature
   ```

1. When finished, submit a PR to the owner's branch and assign it to the owner. The owner will review it, possibly request changes, and merge the PR in.

### Notes

* As with pull requests against `master`, it is better to submit many small PRs than one large PR, if possible.

* Never rebase directly off of `master`.

* Never push directly to the owner's branch.

* Use the "DO NOT MERGE" tage to submit a PR to deploy a review app, and then close the PR when finished.

## Transfer Of Ownership

It will sometimes be appropriate to hand off ownership of a branch. This will usually be from a frontend to a backend developer, or from a backend to another backend developer. This should be the exception and not the norm.
