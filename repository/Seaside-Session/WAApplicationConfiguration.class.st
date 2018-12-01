"
WAApplicationConfiguration defines attributes required by WAApplication. All applications should include this configuration (this is done by default for new applications).

See #addAttributes: for details on provided attributes.
"
Class {
	#name : #WAApplicationConfiguration,
	#superclass : #WASystemConfiguration,
	#category : 'Seaside-Session'
}

{ #category : #description }
WAApplicationConfiguration >> continuationClasses [
	^ (WASessionContinuation allSubclasses reject: [ :each | each isAbstract ])
		asSortedCollection: [ :a :b | a name <= b name ]
]

{ #category : #description }
WAApplicationConfiguration >> describeOn: config [
	(config classBindingCollection: #libraries)
		options: [ self libraryClasses ].
	(config classBinding: #initialContinuationClass)
		beAdvanced;
		options: [ self continuationClasses ];
		default: WANullSessionContinuation.
	(config string: #mimeType)
		beAdvanced;
		label: 'MIME Type';
		comment: 'The media type of HTML documents reported to the browser.';
		default: 'text/html'.
	(config url: #resourceBaseUrl)
		group: #server;
		comment: 'Sets the base URL for URLS generated with #resourceUrl:'.
	(config boolean: #sessionAllowTermination)
		comment: 'Whether sessions allows a special HTTP request to terminate the process currently running in the session. This is used during development and should be disabled for deployment.';
		default: false.
	(config classBinding: #sessionClass)
		comment: 'Sessions in this application will be instances of this class.';
		options: [ self sessionClasses ];
		default: WASession.
	(config listOfClasses: #trackingStrategy)
		comment: 'How sessions and document handlers should be tracked.';
		options: [ self trackingStrategyClasses ];
		default: WAQueryFieldHandlerTrackingStrategy new

]

{ #category : #description }
WAApplicationConfiguration >> libraryClasses [
	^ WAAbstractFileLibrary libraries asSortedCollection: [ :a :b | a name <= b name ]
]

{ #category : #ancestry }
WAApplicationConfiguration >> parents [
	"Skip WARegistryConfiguration because we override #trackingStrategy. It doesn't work otherwise."
	^ Array
		with: WARequestHandlingConfiguration instance
		with: WACacheConfiguration instance
]

{ #category : #description }
WAApplicationConfiguration >> sessionClasses [
	^ WASession withAllSubclasses asSortedCollection: [ :a :b | a name <= b name ]
]

{ #category : #description }
WAApplicationConfiguration >> trackingStrategyClasses [
	^ (WAHandlerTrackingStrategy allSubclasses reject: [ :each | each isAbstract ])
		asSortedCollection: [ :a :b | a name <= b name ]
]
