# Introduction #

Pharo Build is a [Hudson](http://www.hudson-ci.org/) plugin to build [Pharo](http://www.pharo-project.org) images.

# Features #
## Project Configuration ##
  * image name
  * script to execute
  * debug log file to watch for, when found will consider the build failed, kill the process and write the contents to the console
## Global Configuration ##
  * VM executable
  * VM parameters
  * before code
  * after code

# Changelog #
## 0.4.1 ##
  * make the file watchdog a demon thread so that the vm can shut down
## 0.4.0 ##
  * removed exclamation marks in the default "After Code" template
  * write starup script in workspace folder and don't delete it after the build
  * removed copy image functionality

# Download #
[Version 0.6.1](https://seaside.googlecode.com/svn/repo/st/seaside/pharo-build/0.6.1/pharo-build-0.6.1.hpi) see the [Hudson page on manually installing plugins](http://wiki.hudson-ci.org/display/HUDSON/Plugins). You need to remove the version from the file name.

# TODO #
  * validation of required parameters in global config
  * validation of required parameters in build config (image name)


# General Open Points #
  * generate Cobertura coverage file
  * run Task scanner on #flag: and #flag
  * write compiler output to stdout or stderr