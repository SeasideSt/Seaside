I represent a file on a file system.

I know the name, the location and the MIME type of the file. I am mainly used for representing temporary files from streamed multipart uploads.

You will probably want to move me from my initial directory (which is probably a temporary directory) to my final destination. E.g.

externalFile fullyQualifiedFilePath asFileReference moveTo: FileLocator imageDirectory / 'final-destination'