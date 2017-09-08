# Ops Error Triage

A guide for monitoring and triaging production errors.

## Roles

- [Ops First Responders](https://github.com/orgs/desiringgod/teams/ops-first-responders/)
   – This is a subset of the Ops Team that actively monitors errors and determines next steps
   - On a weekly rotation, one member of this team leads reviewing and triaging new errors
- [Ops Team](https://github.com/orgs/desiringgod/teams/ops/)
   – This is subset of the [Engineering Team](https://github.com/orgs/desiringgod/teams/engineers/) that is more involved in operations
   - This team helps with operational strategy and refining tooling
   - Any member of this team can be called upon by Ops First Responders to aid in resolving errors

## Process

### Monitoring

Throughout the week, the "_on duty_" member of Ops First Responders team follows this process to monitor new errors.

#### 1. Hand Off

At the beginning of the week when starting to be on duty meet with the person on duty the prior week. During this discussion cover the following points.

- Discuss critical issues and errors:
   - Are there any open items that need shepherding?
   - Were there any closed items in the last week to note?
- Are there any new trends or discoveries or warning themes or other updates?
- Update [slack #ops](https://desiringgod.slack.com/messages/C46JDQQTD) and note who is _on duty_ for the week

#### 2. First Response

- Actively follow [slack #ops](https://desiringgod.slack.com/messages/C46JDQQTD) when on duty and let it interrupt you
- When a new error comes through this channel, investigate what is occurring
- If the issue is critical or an error, go to the [triaging process](#triaging)
- If there are notifications that should be refined or recategorized, help make the necessary updates
- Help close the loop on any active errors and discussions

### Triaging

#### Critical

A _critical_ error is an issue that impacts access to core products and impedes work. Examples include: the whole site is down, the home page of the site is unavailable, large portions of the site are broken, or data is being lost. When a critical error occurs, take the following steps.

- Notify the entire Ops Team on [slack #ops](https://desiringgod.slack.com/messages/C46JDQQTD)
   - If the critical issue arises outside of typical working hours, feel free to call other Ops First Responders to help.
   - _Note_: Currently, some critical issues trigger intentionally disruptive alerts to the entire Ops First Responder team in order to expedite awareness of these issues
- Help ensure that the right people are aware of the issue and beginning to investigate
- Focus the team on identifying the issue and releasing a fix
   - These issues should take priority over other projects for whoever is needed
   - Documentation and precise project management processes are secondary to finding a resolution
   - However, take care if circumventing any typical protocols so additional errors are not introduces
- Retrospectively discuss, document, and create an issue for a more systematic fix and/or prevention for related errors in the future

#### Error

An _error_ occurs when something is broken in production and attention is required. Examples include a broken page, service, or something that is less than [critical](#critical) but more than just a [warning, information, or data](#warning-info-and-data). When an error occurs, the Ops First Responders will take the following steps.

- Review the severity and determine if the error should be escalated to critical
   - If so, jump to the [critical triage](#critical)
   - If not, continue following the steps here
- Investigate the details of the error to learn more
   - Does this relate to a recent change and release?
   - What is the potential impact of this issue?
   - Who else on the team is familiar with this part of the code?
   - Does this seems similar to other errors or warnings?
   - How frequently is the issue occurring?
- Make notes and discover more
   - Add comments to the error
   - Tag an "owner" who might be an appropriate person to explore more if needed
      - _Note_: Assignment in the error monitoring tool does not necessarily require action from the assignee, and the assignee can request that someone different is tagged if there's a better fit
   - Discuss informally on slack as needed
- Create a GitHub Issue to prompt further action
   - To formally triage the error and delegate for resolution, create a GitHub Issue from the error
      - _Note_: if work has already begun and a PR is imminent, an Issue is not required
   - Provide additional details and findings
   - Label the Issue (and/or PR) as a `bug` and `ops` and if a timely fix is required `hotfix`
   - Assign to an Ops Team member
   - Discuss as needed
- Facilitate closing errors
   - As fixes are deployed and errors are clarified, advocate for closing all the loops and notifications and related errors
   - _Note_: Currently, errors are closed by the system after 15 days and reopened if they reoccur

#### Warning, Info, and Data

No triaging action is needed for exceptions that fall into these categories.

-  Warnings: errors logged for future investigations / debugging. These may or may not be a problem. For example, an exception was raised and something went wrong but the site isn't affected and logging this might be helpful if an investigation happens.
- Information: anything logged that should get logged but does not qualify as any of the severity listed above, e.g. 404s errors
- Debug: logged for diagnostic reasons
