"
This adaptor first checks to see if the Seaside response machinery creates a succesful response and if not checks to see if the request can be served by an instance of the ZnStaticFileServerDelegate 

Start it with something like: 


	ZnZincStaticServerAdaptor startOn: 8080 andServeFilesFrom: '/var/www/'.
	

If you want to set cache expiration headers for your static assets you can run this:

	ZnZincStaticServerAdaptor default useDefaultExpirationHeaders.

after you start the ZnZincStaticServerAdaptor.

If you want to set your own expiration headers you can create a Dictionary like the one in ZnStaticFileServerDelegate class>>#defaultMimeTypeExpirations and then run:

	ZnZincStaticServerAdaptor default useCustomExpirationHeaders: myExpriationHeadersDirectory.
	
where 'myExpirationHeadersDirectory' is structured similarly to the #defaultMimeTypeExpirations 
"
Class {
	#name : #ZnZincStaticServerAdaptor,
	#superclass : #ZnZincServerAdaptor,
	#category : 'Zinc-Seaside'
}

{ #category : #'as yet unclassified' }
ZnZincStaticServerAdaptor class >> startOn: aPortNumber andServeFilesFrom: aDirectoryPathString [
	self startOn: aPortNumber.
	self default server delegate serveFilesFrom: aDirectoryPathString
]

{ #category : #defaults }
ZnZincStaticServerAdaptor >> defaultDelegate [
	^ ZnSeasideStaticServerAdaptorDelegate with: self
]

{ #category : #accessing }
ZnZincStaticServerAdaptor >> useCustomExpirationHeaders: aDictionaryOfMimeTypesAndHeaders [
	self server delegate staticDelegate mimeTypeExpirations: aDictionaryOfMimeTypesAndHeaders
]

{ #category : #accessing }
ZnZincStaticServerAdaptor >> useDefaultExpirationHeaders [
	self server delegate staticDelegate mimeTypeExpirations: ZnStaticFileServerDelegate defaultMimeTypeExpirations
]
