"
This adaptor first checks to see if the Seaside response machinery creates a succesful response and if not checks to see if the request can be served by an instance of the ZnStaticFileServerDelegate 

Instance Variables:
    staticDelegate	aZnStaticFileServerDelegate
    wwwRootDirectory - The directory on your file system where the JS/CSS/JPEG etc. files you want to serve reside
"
Class {
	#name : #ZnSeasideStaticServerAdaptorDelegate,
	#superclass : #ZnSeasideServerAdaptorDelegate,
	#instVars : [
		'staticDelegate',
		'wwwRootDirectory'
	],
	#category : 'Zinc-Seaside'
}

{ #category : #public }
ZnSeasideStaticServerAdaptorDelegate >> handleRequest: znRequest [
	"If the Seaside request processing apparatus returns an HTTP response with an error 
	check the filesystem for a file that matches the uri of the request, if found send the file if not send an error."

	| response |
	response := self adaptor process: znRequest.
	^ (response isError and: [ response isAuthenticationRequired not ])
			ifTrue: [ self staticDelegate handleRequest: znRequest ]
			ifFalse: [ response ].
]

{ #category : #initialization }
ZnSeasideStaticServerAdaptorDelegate >> initializeStaticDelegate [
	^ ZnStaticFileServerDelegate new
		directory: self wwwRootDirectory;
		yourself
]

{ #category : #updating }
ZnSeasideStaticServerAdaptorDelegate >> serveFilesFrom: aDirectoryPathString [
	self wwwRootDirectory: (ZnFileSystemUtils directory: aDirectoryPathString )
]

{ #category : #accessing }
ZnSeasideStaticServerAdaptorDelegate >> staticDelegate [
	^ staticDelegate ifNil: [ staticDelegate := self initializeStaticDelegate ]
]

{ #category : #accessing }
ZnSeasideStaticServerAdaptorDelegate >> wwwRootDirectory [
	"This is the root directory for your css/js/images etc...."

	^ wwwRootDirectory ifNil: [ 
		wwwRootDirectory := ZnFileSystemUtils directory: '/var/www' ]
]

{ #category : #accessing }
ZnSeasideStaticServerAdaptorDelegate >> wwwRootDirectory: fileDirectory [
	"This is the root directory for your css/js/images etc...."

	wwwRootDirectory := fileDirectory
]
