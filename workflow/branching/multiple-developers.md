
# Branching with Multiple Developers

How to handle branching when multiple developers are involved

## Preconditions

* Choose one developer to be the owner of the branch. This developer will be responsible for merging in code done by other developers and generally responsible for the health and status of the branch (such as keeping it rebased against master.)

## To Begin

1. The owner of the branch should always create the branch, even if they will not be doing the first commit on the branch.

2. The owner should push the branch to origin when the next developer will need to be involved.

## When Another Developer Gets Involved

1. When another developer is ready to start working on the branch, they should first pull the branch from origin.

2. This developer should never make changes directly on the branch. They should create another branch off off the original branch.

3. When they've finished a set of changes, they should submit a PR against the original branch, assigning it to the owner of the branch.

4. The owner of the branch can review the PR to the level of satisfaction they would like before merging it in, and can request any changes they would like. There is no formal process for this, and the level of detail or quality required here is unique and specific to each branch and situation.

5. The recommendation is to submit lots of smaller PRs rather than one bigger one, and create new branches regularly.

## Other Notes

1. If the original branch needs changes from master, only the owner of the branch should rebase off master, the developer gets explicit permission from the owner of the branch.

2. Likewise, only the owner of the branch should ever do a force push (`git push -f`) on the branch unless they have explicit permission from the owner.

3. Other developers can submit PRs tagged as DO NOT MERGE if they need to deploy a review app and then close their PR when they are done.
