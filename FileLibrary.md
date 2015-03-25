The WAFileMetadataLibrary seeks to address the following issues which WAFileLibrary didn't support:
  * **Arbitrary support for filenames** JQuery-UI theme libraries contain currently unsupported filenames such as "e6e6e6\_40x100\_textures\_02\_glass\_75.png".
  * **Arbitrary directories for files** JQuery-UI (and Twitter Bootstrap) expects certain JavaScript files, images etc in a subdirectory, such as "ui/i18n/ui.datepicker-de.js".
  * **Arbitrary mime-types for files** Currently mime-types are determined from the file-extension, sometimes it would be good to have some more control.


WAAbstractFileLibrary has been introduced which acts as a base for the old file libraries derived from WAFileLibrary and introduces a new subclass WAFileMetadataLibrary. WAFileM​etadataLibrary supports resources with paths, which is handy when, for example, the javascript or css in a file library expects its supporting images to be in subdirectories such as img/xxxx.png. WAFileMetadataLi​brary also records the original filenames so that when you #deployFiles from the file library on a production server, the exported files will maintain their original names and paths.

WAFileMetadataLibrary allows for the easy integration of libraries such as Twitter Bootstrap.

There's a new method for recursing a sub-directory tree to add all the files and record their relative paths:

`MYWAFileMetadataDerivedFileLib​rary recursivelyAddAllFilesIn: '/var/www/files/​twitterbootstrap'`

The work was based on a previous implementation by Avi Shefi with ideas from Boris Popov.

see [issue 267](http://code.google.com/p/seaside/issues/detail?id=267) for further detail.