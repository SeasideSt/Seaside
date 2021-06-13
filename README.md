# The framework for developing sophisticated web applications in Smalltalk.

Seaside provides a layered set of abstractions over HTTP and HTML that let you build highly interactive web applications quickly, reusably and maintainably. It is based on Smalltalk, a proven and robust language that is implemented by  different vendors. Seaside includes:

  * [Programmatic HTML generation](https://github.com/SeasideSt/Seaside/wiki/Generating-HTML).  A lot of markup is boilerplate: the same patterns of lists, links, forms and tables show up on page after page. Seaside has a rich API for generating HTML that lets you abstract these patterns into convenient methods rather than pasting the same sequence of tags into templates every time.

  * [Callback-based request handling](https://github.com/SeasideSt/Seaside/wiki/Links%2C-Forms-and-Callbacks).  Why should you have to come up with a unique name for every link and form input on your page, only to extract them from the URL and request fields later?  Seaside automates this process by letting you associate blocks, not names, with inputs and links, so you can think about objects and methods instead of ids and strings.

  * [Embedded components](https://github.com/SeasideSt/Seaside/wiki/Embedding-Subcomponents).  Stop thinking a whole page at a time; Seaside lets you build your UI as a tree of individual, stateful component objects, each encapsulating a small part of a page.  Often, these can be used over and over again, within and between applications - nearly every application, for example, needs a way to present a batched list of search results, or a table with sortable columns, and Seaside includes components for these out the box.

  * [Modal session management](https://github.com/SeasideSt/Seaside/wiki/Call-and-Answer).  What if you could express a complex, multi-page workflow in a single method?  Unlike servlet models which require a separate handler for each page or request, Seaside models an entire user session as a continuous piece of code, with natural, linear control flow.  In Seaside, components can call and return to each other like subroutines; string a few of those calls together in a method, just as if you were using console I/O or opening modal dialog boxes, and you have a workflow. And yes, the back button will still work.

Seaside also has good support for [CSS and Javascript](https://github.com/SeasideSt/Seaside/wiki/CSS-and-Javascript), excellent [web-based development tools](https://github.com/SeasideSt/Seaside/wiki/Development-Tools) and [debugging support](https://github.com/SeasideSt/Seaside/wiki/Debugging-Seaside-Applications), a rich [configuration and preferences](https://github.com/SeasideSt/Seaside/wiki/Configuration-and-Preferences) framework, and more.

## Getting Started

Seaside is composed of different parts, allowing you to only load the parts you need for your project. If you are new to Seaside, we advise you to load the default set of packages by simply following the load instructions below. If you want to load specific (or additional) parts of Seaside, check out the [list of groups and packages](https://github.com/SeasideSt/Seaside/wiki/Seaside-Load-Groups-and-Packages).

We provide instructions to get started with Seaside in [Pharo](http://www.pharo-project.org), [Gemstone](https://gemtalksystems.com/products/gs64/) or [Squeak](http://www.squeak.org). See the appropriate instructions for your platform below.

### Instructions for Pharo

#### Load Seaside
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
#### Launch the Welcome page

If you installed Seaside using the instructions above, the `Welcome` package was loaded and a default server adaptor was started on port 8080. Open a webbrowser on (http://localhost:8080) and you should see the Seaside Welcome page. Happy Seasiding!

### Instructions for Gemstone

#### Load Seaside
To install the latest stable version of Seaside in a [Gemstone](https://gemtalksystems.com/products/gs64/) repository, execute the following steps:

1. Upgrade to the latest version of Metacello and Grease using [GsUpgrader](https://github.com/GsDevKit/gsUpgrader#gsupgrader-):
  ```Smalltalk
  Gofer new
    package: 'GsUpgrader-Core';
    url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
    load.
  (Smalltalk at: #GsUpgrader) upgradeGrease.
  ```
  
2. Install Seaside:

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
  
### Instructions for Squeak

#### Squeak >= 5.2
To install the latest stable version of Seaside in a [Squeak](http://www.squeak.org) image you need to first install [Metacello](https://github.com/Metacello/metacello):
```Smalltalk
Installer ensureRecentMetacello.
```
From there on, follow the [installation instructions for Seaside in Pharo](README.md#install-in-pharo).

#### Squeak < 5.2
Make sure you have installed [Metacello](https://github.com/Metacello/metacello#squeak-older-than-squeak52). From there on, follow the [installation instructions for Seaside in Pharo](README.md#install-in-pharo).


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
Check out the Add-on libraries and projects related to Seaside: https://github.com/SeasideSt/Seaside/wiki/Add-On-Libraries

We have a low traffic mailing list for questions ([sign up here](http://lists.squeakfoundation.org/cgi-bin/mailman/listinfo/seaside)) and a (Smalltalk dialect independant) channel on the [Pharo](https://pharo.org) Discord ([sign up here](http://discord.gg/Sj2rhxn)).

## Contributing
If you would like to contribute, please visit the [Seaside's contributors page](https://github.com/SeasideSt/Seaside/blob/master/CONTRIBUTING.md).

## More
Please check the [Wiki](https://github.com/SeasideSt/Seaside/wiki) for more information.

## Status of automated builds
[![smalltalkCI](https://github.com/SeasideSt/Seaside/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/SeasideSt/Seaside/actions/workflows/ci.yml) See https://github.com/SeasideSt/Seaside/actions/workflows/ci.yml