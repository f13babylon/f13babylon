# CONTRIBUTING

1. [Reporting Issues](#reporting-issues)
2. [Introduction](#introduction)
3. [Getting Started](#getting-started)
4. [Meet the Team](#meet-the-team)
    1. [Headcoder](#headcoder)
    2. [Maintainers](#maintainers)
5. [Development Guides](#development-guides)
6. [Pull Request Process](#pull-request-process)
7. [Porting features/sprites/sounds/tools from other codebases](#porting-featuresspritessoundstools-from-other-codebases)
8. [Banned content](#banned-content)
9. [A word on Git](#a-word-on-git)

## Reporting Issues

See [this page](https://github.com/f13babylon/f13babylon/issues/new/choose) for a guide and format to issue reports.

## New Babylon Contributions and Modularization

Everything below this New Babylon entry comes from the original /tg/ documentation for contribution and code quality. There are a few key things we ask from our contributors specifically however and I'd like to cover those briefly.

**Quality**
All contributions should be formatted well and follow traditional SS13 code standards you might find on /tg/. Failure to maintain code standards will result in your Pull Request being reviewed with 'requested changes', where you will have around 7 days to correct any errors before the request is closed on our end. Note, just because we close out your request doesn't mean you can't continue your work! If you cannot make the requested changes within that time window, speak to a maintainer or simply work at your own pace on your fork and open another Pull Request when you are ready for another review.

**Modularization**
While there is no requirement to adhere to the modularisation procedures you may find in a traditional upstream-downstream relationship - due to the outdated nature of the code, as well as the lack of a direct upstream - the more modular your code is the more maintainable it tends to be. As a result, unnecessarily splintered code may be requested to be consolidated within a module. Modularity comments, however, are not required.

# From hereon is the /tg/station contribution guide

## Introduction

Hello and welcome to /tg/station's contributing page. You are here because you are curious or interested in contributing - thank you! Everyone is free to contribute to this project as long as they follow the simple guidelines and specifications below; at /tg/station, we strive to maintain code stability and maintainability, and to do that, we need all pull requests to hold up to those specifications. It's in everyone's best interests - including yours! - if the same bug doesn't have to be fixed twice because of duplicated code.

First things first, we want to make it clear how you can contribute (if you've never contributed before), as well as the kinds of powers the team has over your additions, to avoid any unpleasant surprises if your pull request is closed for a reason you didn't foresee.

## Getting Started

/tg/station doesn't have a list of goals and features to add; we instead allow freedom for contributors to suggest and create their ideas for the game. That doesn't mean we aren't determined to squash bugs, which unfortunately pop up a lot due to the deep complexity of the game. Here are some useful starting guides, if you want to contribute or if you want to know what challenges you can tackle with zero knowledge about the game's code structure.

If you want to contribute the first thing you'll need to do is [set up Git](http://tgstation13.org/wiki/Setting_up_git) so you can download the source code.

We have a [list of guides on the wiki](http://www.tgstation13.org/wiki/index.php/Guides#Development_and_Contribution_Guides) that will help you get started contributing to /tg/station with Git and Dream Maker. For beginners, it is recommended you work on small projects like bugfixes at first. If you need help learning to program in BYOND, check out this [repository of resources](http://www.byond.com/developer/articles/resources).

There is an open list of approachable issues for [your inspiration here](https://github.com/tgstation/-tg-station/issues?q=is%3Aopen+is%3Aissue+label%3A%22Good+First+Issue%22).

You can of course, as always, ask for help at [#coderbus](irc://irc.rizon.net/coderbus) on irc.rizon.net. We're just here to have fun and help out, so please don't expect professional support.

## Meet the Team

**Headcoder**

The Headcoder is responsible for controlling, adding, and removing maintainers from the project. In addition to filling the role of a normal maintainer, they have sole authority on who becomes a maintainer, as well as who remains a maintainer and who does not.

**Maintainers**

Maintainers are quality control. If a proposed pull request doesn't meet the following specifications, they can request you to change it, or simply just close the pull request. Maintainers are required to give a reason for closing the pull request.

Maintainers can revert your changes if they feel they are not worth maintaining or if they did not live up to the quality specifications.

## Development Guides

#### Writing readable code

[Style guide](./guides/STYLE.md)

#### Writing sane code

[Code standards](./guides/STANDARDS.md)

#### Writing understandable code

[Autodocumenting code](./guides/AUTODOC.md)

#### Misc

-   [Embedding TGUI Components in Chat](../tgui/docs/chat-embedded-components.md)
-   [Hard Deletes](./guides/HARDDELETES.md)
-   [MC Tab Guide](./guides/MC_tab.md)
-   [Policy Configuration System](./guides/POLICYCONFIG.md)
-   [Quickly setting up a development database with ezdb](./guides/EZDB.md)
-   [Required Tests (Continuous Integration)](./guides/CI.md)
-   [Splitting up pull requests, aka atomization](./guides/ATOMIZATION.md)
-   [UI Development](../tgui/README.md)
-   [Visual Effects and Systems](./guides/VISUALS.md)

## Pull Request Process

There is no strict process when it comes to merging pull requests. Pull requests will sometimes take a while before they are looked at by a maintainer; the bigger the change, the more time it will take before they are accepted into the code. Every team member is a volunteer who is giving up their own time to help maintain and contribute, so please be courteous and respectful. Here are some helpful ways to make it easier for you and for the maintainers when making a pull request.

-   Make sure your pull request complies to the requirements outlined here

-   You are expected to have tested your pull requests if it is anything that would warrant testing. Text only changes, single number balance changes, and similar generally don't need testing, but anything else does. This means by extension web edits are disallowed for larger changes.

-   You are going to be expected to document all your changes in the pull request. Failing to do so will mean delaying it as we will have to question why you made the change. On the other hand, you can speed up the process by making the pull request readable and easy to understand, with diagrams or before/after data. Should you be optimizing a routine you must provide proof by way of profiling that your changes are faster.

-   We ask that you use the changelog system to document your player facing changes, which prevents our players from being caught unaware by said changes - you can find more information about this [on this wiki page](http://tgstation13.org/wiki/Guide_to_Changelogs).

-   If you are proposing multiple changes, which change many different aspects of the code, you are expected to [section them off into different pull requests](./guides/ATOMIZATION.md) in order to make it easier to review them and to deny/accept the changes that are deemed acceptable.

-   If your pull request is accepted, the code you add no longer belongs exclusively to you but to everyone; everyone is free to work on it, but you are also free to support or object to any changes being made, which will likely hold more weight, as you're the one who added the feature. It is a shame this has to be explicitly said, but there have been cases where this would've saved some trouble.

-   If your pull request is not finished, you may open it as a draft for potential review. If you open it as a full-fledged PR make sure it is at least testable in a live environment. Pull requests that do not at least meet this requirement will be closed. You may request a maintainer reopen the pull request when you're ready, or make a new one.

-   While we have no issue helping contributors (and especially new contributors) bring reasonably sized contributions up to standards via the pull request review process, larger contributions are expected to pass a higher bar of completeness and code quality _before_ you open a pull request. Maintainers may close such pull requests that are deemed to be substantially flawed. You should take some time to discuss with maintainers or other contributors on how to improve the changes.

-   After leaving reviews on an open pull request, maintainers may convert it to a draft. Once you have addressed all their comments to the best of your ability, feel free to mark the pull as `Ready for Review` again.

## Justifying Your Changes

You must explain why you are submitting the pull request in the "Why It's Good For The Game" section of your pull request, and how you think your change will be beneficial to the game. Failure to do so will be grounds for rejecting your pull request wholesale, or requiring that you fix it before your pull request is merged. A reasonable justification for your changes is a requirement.

Your "Why It's Good For The Game" section must make a good faith and reasonable attempt to:

-   Assert and argue that the current state of affairs in the game is not good, and needs changing.
-   Assert and argue that your pull request will either fix or help fix the problems you described.
-   Assert and argue that any downsides introduced by your solution as a matter of design, if any, are worth it, and why they are worth it.

More controversial changes have higher standards for justification to be considered reasonable. A bugfix for example does not typically require any effort at all in justification as its value to the game is usually self evident, however a major feature overhaul or balance change may require significant explanation to adequately justify its supposed benefit to the game.

This is still a requirement if your pull request is supported and/or requested by maintainers before it is opened. This is still a requirement if your pull request is supported and/or requested by head coders before it is opened. The purpose of arguing for your changes is not to convince just the maintainer team of its merits, it is to document the "why" behind your changes to the game to a necessary level of detail. The reason behind a change must exist as it is the purpose of this codebase to improve the game, thus said reasoning must be adequately stated and explained.

This is also still a requirement if your pull request has a corresponding design document that justifies your changes inside it. You must always properly justify changes (those that actually need justification) within the pull request, even if you also do it elsewhere. This is to ensure that:

1. All reviewers can easily see the reasoning behind your changes on the pull request itself, no reliance on other sites required.
2. The actual, manifested implementation of the idea behind the design document is being justified after said implementation is actually realized. This is in contrast to any reasoning put on the design document itself, which very well may have been made before any work was done on it, possibly even by an author different from the author of the pull request. Any idea in the design document may have had compromises put into it due to complications not seen in the original vision, thus the current state of the implementation (the pull request as it stands) must be defended, explained, and ultimately justified in and of itself. Of course, you should still list the design document the pull request is implementing, and may even use arguments from the design document if said arguments are applicable to the current reality of your proposed changes.

## Porting features/sprites/sounds/tools from other codebases

If you are porting features/tools from other codebases, you must give them credit where it's due. Typically, crediting them in your pull request and the changelog is the recommended way of doing it. Take note of what license they use though, porting stuff from AGPLv3 and GPLv3 codebases are allowed.

Regarding sprites & sounds, you must credit the artist and possibly the codebase. All /tg/station assets including icons and sound are under a [Creative Commons 3.0 BY-SA license](https://creativecommons.org/licenses/by-sa/3.0/) unless otherwise indicated. However if you are porting assets from GoonStation or usually any assets under the [Creative Commons 3.0 BY-NC-SA license](https://creativecommons.org/licenses/by-nc-sa/3.0/) are to go into the 'goon' folder of the /tg/station codebase.

## Banned content

Do not add any of the following in a Pull Request or risk getting the PR closed:

-   National Socialist Party of Germany content, National Socialist Party of Germany related content, or National Socialist Party of Germany references
-   Code where one line of code is split across mutiple lines (except for multiple, separate strings and comments; in those cases, existing longer lines must not be split up)

Just because something isn't on this list doesn't mean that it's acceptable. Use common sense above all else.

## Content requiring prior approval

Certain types of changes may require prior approval from maintainers. This currently includes:

-   Code adding, removing, or updating the availability of alien races/species/human mutants. This includes pull requests attempting to add or remove features from said races/species/mutants. (Requires approval from at least one maintainer)
-   Code adding, removing, or modifying the functionality of adult-oriented features (such as, but not limited to: vore, genitals, MKUltra, and more). This also includes pull requests attempting to add or remove these features outright. (Requires approval from at least half of the formal maintainer team)

The above content requires approval from the specified amount of maintainers prior to PR creation. Seeking approval must be done via a @Maintainer ping in a relevant development/code or staff channel on the Discord, otherwise it will be considered insufficient. If a PR contains any of the above content, but the creator does not have sufficient approval prior to the PR's creation, then the PR may be closed by any maintainer, at any time, for any reason.

## A word on Git

Yes, we know that the files have a tonne of mixed Windows and Linux line endings. Attempts to fix this have been met with less than stellar success, and as such we have decided to give up caring until there comes a time when it matters.

Therefore, EOF settings of main repo are forbidden territory one must avoid wandering into, at risk of losing body and/or mind to the Git gods.
