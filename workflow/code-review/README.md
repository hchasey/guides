# Code Review

A guide for reviewing code and having your code reviewed.

## Summary of roles

- `author` — the person(s) who wrote the commit(s). Will not change.
- `reviewer` — the person(s) who reviews and approves/rejects the PR. Usually will not change.
- `assignee` — the person(s) who is responsible for the next action. The ball is in their court. Will change.

## Process

1. Begin a code review by submitting a PR against the branch you want your code merged into. This will usually be the `master` branch, but could be another branch.
  - If this has any user facing UX or UI changes, be sure to include a screenshot, or preferrably, a gif of the change this PR introduces.
    - This helps the reviewer gain context and a visual cue to what they should look out for.
    - Tools you can use to create the screenshots or gifs:
      - [macOS built in screenshot feature](http://www.imore.com/screenshot-mac)
      - [Skitch](https://evernote.com/skitch/)
      - [Giphy Capture](https://giphy.com/apps#giphycapture)
1. Use the "reviewers" field to indicate who should review your PR. Be proactive and pick who you think would be best and assign them.
  - You can assign one or more than one person.
  - You can choose reviewers based on expertise and/or based on availability.
  - You can determine availability by asking the team or seeing who has few PRs assigned in GitHub.
  - If you are unsure who to assign, this can be left blank until you are ready to begin the review process.
1. When your code is ready for review, make the reviewers the "assignees".
1. The reviewer then reviews the code and either approves it or requests changes, using the GitHub widget.
1. The reviewer should assign the PR back to the author when the author needs to take the next action (either respond to questions, make changes, or release).
1. Once approved, the PR is ready to be merged.
  - If the PR is against `master`, the **author** triggers a release by merging, first announcing the release to the team.
  - If the PR is against another branch, the **branch owner** may merge into the parent branch when desired.
1. Once merged, delete the branch.

## Remember

### Everyone

* Accept that many programming decisions are opinions. Discuss tradeoffs, which
  you prefer, and reach a resolution quickly.
* Ask questions; don't make demands. ("What do you think about naming this
  `:user_id`?")
* Ask for clarification. ("I didn't understand. Can you clarify?")
* Avoid selective ownership of code. ("mine", "not mine", "yours")
* Avoid using terms that could be seen as referring to personal traits. ("dumb",
  "stupid"). Assume everyone is attractive, intelligent, and well-meaning.
* Be explicit. Remember people don't always understand your intentions online.
* Be humble. ("I'm not sure - let's look it up.")
* Don't use hyperbole. ("always", "never", "endlessly", "nothing")
* Don't use sarcasm.
* Keep it real. If emoji, animated gifs, or humor aren't you, don't force them.
  If they are, use them with aplomb.
* Talk synchronously (e.g. chat, screensharing, in person) if there are too many
  "I didn't understand" or "Alternative solution:" comments. Post a follow-up
  comment summarizing the discussion.

### Having Your Code Reviewed

* Be grateful for the reviewer's suggestions. ("Good call. I'll make that
  change.")
* Don't take it personally. The review is of the code, not you.
* Explain why the code exists. ("It's like that because of these reasons. Would
  it be more clear if I rename this class/file/method/variable?")
* Extract some changes and refactorings into future tickets/stories.
* Link to the PR from the trello card. ("Ready for review:
  https://github.com/organization/project/pull/1")
* Link to the trello card from the PR. ("Created from:
  https://trello/c/aBcD12/my-feature")
* Push commits based on earlier rounds of feedback as isolated commits to the
  branch. Do not squash until the branch is ready to merge. Reviewers should be
  able to read individual updates based on their earlier feedback.
* Seek to understand the reviewer's perspective.
* Try to respond to every comment.
* Wait to merge the branch until Continuous Integration tells you the test suite is green in the branch.
* Merge once you feel confident in the code and its impact on the project.

### Reviewing Code

Understand why the change is necessary (fixes a bug, improves the user
experience, refactors the existing code). Then:

* Communicate which ideas you feel strongly about and those you don't.
* Identify ways to simplify the code while still solving the problem.
* If discussions turn too philosophical or academic, move the discussion offline
  to a regular Friday afternoon technique discussion. In the meantime, let the
  author make the final decision on alternative implementations.
* Offer alternative implementations, but assume the author already considered
  them. ("What do you think about using a custom validator here?")
* Seek to understand the author's perspective.
* Sign off on the pull request with a :thumbsup: or "Ready to merge" comment.
* Wait to merge the branch until Continuous Integration.
  tells you the test suite is green in the branch.
* Merge once you feel confident in the code and its impact on the project.
