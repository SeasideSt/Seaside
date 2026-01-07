"
avoid throwing a 404 if there is no favicon
avoid showing cached versions of favicon

https://github.com/SeasideSt/Seaside/issues/1445
"
Class {
	#name : 'WAFaviconHandler',
	#superclass : 'WARequestHandler',
	#category : 'Seaside-Tools-Web',
	#package : 'Seaside-Tools-Web'
}

{ #category : 'initialize' }
WAFaviconHandler class >> initialize [
 
	WADispatcher default register: self new at: 'favicon.ico'
]

{ #category : 'handling' }
WAFaviconHandler >> handleFiltered: aRequestContext [

	aRequestContext response
		contentType: WAMimeType imageXIcon;
		binary;
		nextPutAll: WAToolFiles basicNew faviconIco
]
