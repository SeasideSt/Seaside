"
I am ZnSeasideServerAdaptorDelegate.

I handle Zinc HTTP Server delegate's #handleRequest: using WAServerAdaptor>>#process:

Instance Variables:
	adaptor	<WAServerAdaptor>
"
Class {
	#name : #ZnSeasideServerAdaptorDelegate,
	#superclass : #Object,
	#instVars : [
		'adaptor'
	],
	#category : 'Zinc-Seaside'
}

{ #category : #'instance creation' }
ZnSeasideServerAdaptorDelegate class >> forServer: znServer [
	| adaptor |
	adaptor := ZnZincServerAdaptor new.
	adaptor unregister.
	adaptor server: znServer.
	^ self with: adaptor
]

{ #category : #examples }
ZnSeasideServerAdaptorDelegate class >> installInDefaultServer [
	^ self installInServer: ZnServer default
]

{ #category : #examples }
ZnSeasideServerAdaptorDelegate class >> installInServer: znServer [
	^ self installInServer: znServer underPrefix: 'seaside'
]

{ #category : #examples }
ZnSeasideServerAdaptorDelegate class >> installInServer: znServer underPrefix: prefix [
	"Install a ZnSeasideServerAdaptorDelegate in znServer under prefix,
	provided znServer contains a ZnDefaultServerDelegate instance as primary delegate.
	Note that the incoming request is destructively modified.
	Note that a global #serverPath is added to the default Seaside dispatcher."

	| seasideDelegate |
	seasideDelegate := self forServer: znServer.
	znServer delegate
		map: 'seaside'
		to: [ :request | 
			request uri removeFirstPathSegment.
			seasideDelegate handleRequest: request ].
	WAAdmin defaultDispatcher serverPath: prefix.
	^ seasideDelegate
]

{ #category : #'instance creation' }
ZnSeasideServerAdaptorDelegate class >> with: aSeasideServerAdaptor [
	^ self new
		adaptor: aSeasideServerAdaptor;
		yourself
]

{ #category : #accessing }
ZnSeasideServerAdaptorDelegate >> adaptor [
	^ adaptor
]

{ #category : #accessing }
ZnSeasideServerAdaptorDelegate >> adaptor: aSeasideServerAdaptor [
	adaptor := aSeasideServerAdaptor
]

{ #category : #public }
ZnSeasideServerAdaptorDelegate >> handleRequest: znRequest [
	"I pass a Zinc HTTP Components ZnRequest to my Seaside Server Adaptor using #process:"

	^ self adaptor process: znRequest
]

{ #category : #public }
ZnSeasideServerAdaptorDelegate >> handleRequest: request gemServer: gemServer [
  "transactions handled by the adaptor"

  ^ self handleRequest: request
]

{ #category : #public }
ZnSeasideServerAdaptorDelegate >> value: request [
	"I implement the generic #value: message as equivalent to #handleRequest:"
	
	^ self handleRequest: request
]
