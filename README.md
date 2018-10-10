# The framework for developing sophisticated web applications in Smalltalk.
## Status of automated builds
### master
Pharo | Squeak | GemStone
------------ | ------------- | ------------
[![Build status: Pharo-7.0](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=master&env=BUILD_NAME=Pharo-7.0&label=7.0)](http://travis-ci.org/SeasideSt/Seaside) | [![Build status: Squeak-5.2](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=master&env=BUILD_NAME=Squeak-trunk&label=5.2)](http://travis-ci.org/SeasideSt/Seaside) | [![Build status: GemStone-3.4.0](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=master&env=BUILD_NAME=GemStone-3.4.0&label=3.4.0)](http://travis-ci.org/SeasideSt/Seaside)
[![Build status: Pharo-6.1](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=master&env=BUILD_NAME=Pharo-6.1&label=6.1)](http://travis-ci.org/SeasideSt/Seaside) | [![Build status: Squeak-5.1](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=master&env=BUILD_NAME=Squeak-5.1&label=5.1)](http://travis-ci.org/SeasideSt/Seaside) | [![Build status: GemStone-3.3.6](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=master&env=BUILD_NAME=GemStone-3.3.6&label=3.3.6)](http://travis-ci.org/SeasideSt/Seaside)
[![Build status: Pharo-6.0](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=master&env=BUILD_NAME=Pharo-6.0&label=6.0)](http://travis-ci.org/SeasideSt/Seaside) | - | [![Build status: GemStone-3.2.17](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=master&env=BUILD_NAME=GemStone-3.2.17&label=3.2.17)](http://travis-ci.org/SeasideSt/Seaside)
[![Build status: Pharo-5.0](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=master&env=BUILD_NAME=Pharo-5.0&label=5.0)](http://travis-ci.org/SeasideSt/Seaside) | - | [![Build status: GemStone-3.1.0.6](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=master&env=BUILD_NAME=GemStone-3.1.0.6&label=3.1.0.6)](http://travis-ci.org/SeasideSt/Seaside)
\- | - | [![Build status: GemStone-2.4.8](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=master&env=BUILD_NAME=GemStone-2.4.8&label=2.4.8)](http://travis-ci.org/SeasideSt/Seaside)

### development
Pharo | Squeak | GemStone/S
------------ | ------------- | ------------
[![Build status: Pharo-7.0](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=develop&env=BUILD_NAME=Pharo-7.0&label=7.0)](http://travis-ci.org/SeasideSt/Seaside) | [![Build status: Squeak-5.2](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=develop&env=BUILD_NAME=Squeak-trunk&label=5.2)](http://travis-ci.org/SeasideSt/Seaside) | [![Build status: GemStone-3.4.0](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=develop&env=BUILD_NAME=GemStone-3.4.0&label=3.4.0)](http://travis-ci.org/SeasideSt/Seaside)
[![Build status: Pharo-6.1](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=develop&env=BUILD_NAME=Pharo-6.1&label=6.1)](http://travis-ci.org/SeasideSt/Seaside) | [![Build status: Squeak-5.1](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=develop&env=BUILD_NAME=Squeak-5.1&label=5.1)](http://travis-ci.org/SeasideSt/Seaside) | [![Build status: GemStone-3.3.6](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=develop&env=BUILD_NAME=GemStone-3.3.6&label=3.3.6)](http://travis-ci.org/SeasideSt/Seaside)
[![Build status: Pharo-6.0](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=develop&env=BUILD_NAME=Pharo-6.0&label=6.0)](http://travis-ci.org/SeasideSt/Seaside) | - | [![Build status: GemStone-3.2.17](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=develop&env=BUILD_NAME=GemStone-3.2.17&label=3.2.17)](http://travis-ci.org/SeasideSt/Seaside)
[![Build status: Pharo-5.0](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=develop&env=BUILD_NAME=Pharo-5.0&label=5.0)](http://travis-ci.org/SeasideSt/Seaside) | - | [![Build status: GemStone-3.1.0.6](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=develop&env=BUILD_NAME=GemStone-3.1.0.6&label=3.1.0.6)](http://travis-ci.org/SeasideSt/Seaside)
\- | - | [![Build status: GemStone-2.4.8](http://badges.herokuapp.com/travis/SeasideSt/Seaside?branch=develop&env=BUILD_NAME=GemStone-2.4.8&label=2.4.8)](http://travis-ci.org/SeasideSt/Seaside)

Seaside provides a layered set of abstractions over HTTP and HTTP that let you build highly interactive web applications quickly, reusably and maintainably. It is based on Smalltalk, a proven and robust language that is implemented by  different vendors. Seaside includes:

  * [Programmatic HTML generation](https://github.com/SeasideSt/Seaside/wiki/Generating-HTML).  A lot of markup is boilerplate: the same patterns of lists, links, forms and tables show up on page after page.  Seaside has a rich API for generating XHTML that lets you abstract these patterns into convenient methods rather than pasting the same sequence of tags into templates every time.

  * [Callback-based request handling](https://github.com/SeasideSt/Seaside/wiki/Links%2C-Forms-and-Callbacks).  Why should you have to come up with a unique name for every link and form input on your page, only to extract them from the URL and request fields later?  Seaside automates this process by letting you associate blocks, not names, with inputs and links, so you can think about objects and methods instead of ids and strings.

  * [Embedded components](https://github.com/SeasideSt/Seaside/wiki/Embedding-Subcomponents).  Stop thinking a whole page at a time; Seaside lets you build your UI as a tree of individual, stateful component objects, each encapsulating a small part of a page.  Often, these can be used over and over again, within and between applications - nearly every application, for example, needs a way to present a batched list of search results, or a table with sortable columns, and Seaside includes components for these out the box.

  * [Modal session management](https://github.com/SeasideSt/Seaside/wiki/Call-and-Answer).  What if you could express a complex, multi-page workflow in a single method?  Unlike servlet models which require a separate handler for each page or request, Seaside models an entire user session as a continuous piece of code, with natural, linear control flow.  In Seaside, components can call and return to each other like subroutines; string a few of those calls together in a method, just as if you were using console I/O or opening modal dialog boxes, and you have a workflow. And yes, the back button will still work.

Seaside also has good support for [CSS and Javascript](https://github.com/SeasideSt/Seaside/wiki/CSS-and-Javascript), excellent [web-based development tools](https://github.com/SeasideSt/Seaside/wiki/Development-Tools) and [debugging support](https://github.com/SeasideSt/Seaside/wiki/Debugging-Seaside-Applications), a rich [configuration and preferences](https://github.com/SeasideSt/Seaside/wiki/Configuration-and-Preferences) framework, and more.

## Installation

### Install in Pharo

To install the latest stable version of Seaside in a [Pharo](http://www.pharo-project.org) image, execute the following code:

```Smalltalk
Metacello new
 baseline:'Seaside3';
 repository: 'github://SeasideSt/Seaside:master/repository';
 load
```
To install a particular version (see [releases](https://github.com/SeasideSt/Seaside/releases), e.g. 3.2.1):

```Smalltalk
Metacello new
 baseline:'Seaside3';
 repository: 'github://SeasideSt/Seaside:v3.2.1/repository';
 load
```
	
### Install in Gemstone

1. Upgrade to the latest version of Metacello and Grease using [GsUpgrader](https://github.com/GsDevKit/gsUpgrader#gsupgrader-):
  ```Smalltalk
  Gofer new
    package: 'GsUpgrader-Core';
    url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
    load.
  (Smalltalk at: #GsUpgrader) upgradeGrease.
  ```
  
2. Install Seaside 3.2:

  Install the latest commit from the master branch:
  ```Smalltalk
  GsDeployer deploy: [
    Metacello new
      baseline: 'Seaside3';
      repository: 'github://SeasideSt/Seaside:master/repository';
      onLock: [:ex | ex honor];
      load ].
  ```

  Install a particular version, e.g. 3.2.0 (see [Releases](https://github.com/SeasideSt/Seaside/releases) for a list of possible versions):
  ```Smalltalk
  GsDeployer deploy: [
    Metacello new
      baseline: 'Seaside3';
      repository: 'github://SeasideSt/Seaside:v3.2.0/repository';
      onLock: [:ex | ex honor];
      load: #('Development' 'Examples' 'Zinc') ].
  ```
  
### Install in Squeak

Make sure you have installed [Metacello](https://github.com/dalehenrich/metacello-work). From there on, follow the installation instructions for Seaside in Pharo.

### Install older versions in Pharo or Squeak

To install a version older than 3.1.3, you need to load Seaside from Smalltalkhub:

```Smalltalk
Metacello new
  configuration:'Seaside3';
  repository: 'http://www.smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main';
  version: #stable;
  load
```

To install a particular version (e.g. 3.1.0):

```Smalltalk
Metacello new
 configuration:'Seaside3';
 repository: 'http://www.smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main';
 version: '3.1.0';
 load
```

## Community
We have a low traffic mailing list for questions ([sign up here](http://lists.squeakfoundation.org/cgi-bin/mailman/listinfo/seaside)) and a (Smalltalk dialect independant) channel on the [Pharo](https://pharo.org) Discord ([sign up here](http://discord.gg/Sj2rhxn)).

## Contributing
If you would like to contribute, please visit the [Seaside's contributors page](https://github.com/SeasideSt/Seaside/blob/master/CONTRIBUTING.md).

## More

Please check the [Wiki](https://github.com/SeasideSt/Seaside/wiki) for more information.
