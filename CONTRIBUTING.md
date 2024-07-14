Seaside development on git follows the [Github Flow branching model](https://guides.github.com/introduction/flow/). We have one main branch: [master](https://github.com/SeasideSt/Seaside/tree/master): the stable version of Seaside for all platforms.

In addition to the main branch, there may be several feature branches containing work in progress and a [develop](https://github.com/SeasideSt/Seaside/tree/develop) branch where we work on breaking changes for the next major version.

Bugfixes and non-breaking features are always created on a separate feature branch which is merged into both master and develop.
Breaking changes are always done on a separate feature branch which is merged into develop.

# Code
We recommend contributing to Seaside using [Github pull requests](https://help.github.com/articles/using-pull-requests/): fork the repository and submit a pull request with your changes. Core Seaside developers can create a branch in the main Seaside repository but we prefer a pull request is made for inclusion in the main branch as well.

If you are contributing a bugfix or a new feature that is not breaking existing uses, then please pull against the master branch.
If you are contributing breaking changes, then please pull against develop.

We mostly develop in Pharo and use [Iceberg](https://github.com/pharo-vcs/iceberg) to commit the code to git. Dale Henrich's guide to [Getting started with Github](https://github.com/dalehenrich/metacello-work/blob/master/docs/GettingStartedWithGitHub.md) for Smalltalk development is still a good read if you are new to using Github for Smalltalk projects and especially if you are developing using other Smalltalk platforms.

Please take the time to add comments and tests and provide a description of the change and the reason for the change in each commit message. Once you have submitted your pull request, a core developer will review the submission and either provide feedback or integrate the change. Sometimes we decide not to integrate a change. When this happens, there is usually a good reason; please ask if you aren’t clear why your submission was not integrated.

We have fairly detailed [coding conventions](https://github.com/SeasideSt/Seaside/wiki/Coding-Conventions) to help maintain portability. Please read through them to make the job of porting Seaside to other Smalltalk dialects not unnecessarily complex and to maintain a consistent coding style.

We have set-up GitHub actions for continuous integration testing, which will be automatically executed when you submit the pull request. You can run them in your own fork before submitting the pull request, and you can even run them locally. See the [Smalltalk-CI](https://github.com/hpi-swa/smalltalkCI) project for all details.

All Seaside code is licensed under the MIT License and, by submitting code to the project, you are agreeing to provide your code under this license. Before submitting, please also ensure that you have the legal rights to license the code you are submitting; in many areas, your employer may own the rights to code you create even in your spare time.

Seaside development discussions take place:
- on the [Developer Mailing list](http://lists.squeakfoundation.org/mailman/listinfo/seaside-dev). Feel free to send us an email there.
- on the Seaside channel of the [Pharo discord server](https://pharo.org/community)

Once you have submitted a few contributions and are comfortable with our process and coding conventions feel free to ask to be added as a core developer on Github SeasideSt team. Just create an account and ask on the [Developer Mailing list](http://lists.squeakfoundation.org/mailman/listinfo/seaside-dev) or the Discord channel, providing your username. 

# Picking something to work on

If you have no itch to scratch you can pick an issue from the bug tracker that nobody has yet started on to work.

You can see if there are any bugs marked ["BiteSize"](https://github.com/SeasideSt/Seaside/labels/BiteSize). These issues have been marked by the core developers as being appropriate for someone with limited experience or available time and are a good place to get your feet wet. The issue should have a clearly-documented solution and should normally be doable with a few hours of work or less. Still, they may be harder than we thought so if you run into trouble, feel free to ask for help or clarification on the Developer Mailing List


# Checkout

You can follow the regular code loading descriptions for Pharo if you develop on Pharo: https://github.com/SeasideSt/Seaside#instructions-for-pharo
Mind that you should load the 'CI' group for Seaside, which loads all tests like on the CI server.

Here is an alternative script if you are not using Iceberg and/or other local git checkouts:

1. checkout the Grease branch to use
1. checkout the Seaside branch to work on

```st
"load Grease from the checkout"
Metacello new
	baseline: 'Grease';
	repository: 'filetree:///home/user/git/Grease/repository';
	fetch;
	load: 'Core Tests'.

"lock Grease to the checkout"
Metacello image
  project: 'Grease';
  lock.

"load Seaside from the checkout"

[ Metacello new
	baseline: 'Seaside3';
	repository: 'filetree:///home/user/git/Seaside/repository';
	fetch;
	load: 'CI'
]	on: MetacelloAllowLockedProjectChange
	do: [ :e | e honor ]

```

# Non-code contributions

Besides code there are many other ways to help:

- Communication, Marketing
- Documentation
- Release engineering
- Web site
- Ask in the [Mailing Lists](http://www.seaside.st/community/mailinglist).

