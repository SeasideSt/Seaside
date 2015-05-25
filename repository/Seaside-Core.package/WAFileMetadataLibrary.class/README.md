I seek to address the following WAFileLibrary related issues:

-""Arbitrary support for filenames"" JQuery-UI theme libraries contain currently unsupported filenames such as "e6e6e6_40x100_textures_02_glass_75.png".
-""Arbitrary directories for files"" JQuery-UI (and Twitter Bootstrap) expects certain JavaScript files, images etc in a subdirectory, such as "ui/i18n/ui.datepicker-de.js".
-""Arbitrary mime-types for files"" Currently mime-types are determined from the file-extension, sometimes it would be good to have some more control.

WAAbstractFileLibrary has been introduced which acts as a base for the old file libraries derived from WAFileLibrary and introduces a new subclass WAFileMetadataLibrary. WAFileMetadataLibrary supports resources with paths, which is handy when, for example, the javascript or css in a file library expects its supporting images to be in subdirectories such as img/xxxx.png. WAFileMetadataLibrary also records the original filenames so that when you #deployFiles from the file library on a production server, the exported files will maintain their original names and paths.

There's a new method for recursing a sub-directory tree to add all the files and record their relative paths:

=MYWAFileMetadataDerivedFileLibrary recursivelyAddAllFilesIn: '/var/www/files/twitterbootstrap'