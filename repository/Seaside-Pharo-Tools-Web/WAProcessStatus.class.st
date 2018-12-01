"
A WAProcessStatus displays information about the Process instances in this image.
"
Class {
	#name : #WAProcessStatus,
	#superclass : #WAPharoStatusItem,
	#category : 'Seaside-Pharo-Tools-Web'
}

{ #category : #private }
WAProcessStatus >> isWaitingOnSemaphore: aProcess [
	"answers whether the given Process is waiting on a semaphore"

	^ aProcess suspendingList isKindOf: Semaphore
]

{ #category : #accessing }
WAProcessStatus >> priority [
	^ 800
]

{ #category : #accessing }
WAProcessStatus >> processes [
	^ (Process allSubInstances
		reject: [ :each | each isTerminated or: [ each = Processor activeProcess ] ])
		sorted: [ :a :b | a priority >= b priority ] 
]

{ #category : #rendering }
WAProcessStatus >> renderHeaderOn: html [
	html tableHead: [
		html tableRow: [
			html tableHeading: 'Name'.
			html tableHeading: 'Priority'.
			html tableHeading: 'Process'.
			html tableData ] ]
]

{ #category : #rendering }
WAProcessStatus >> renderInspect: aProcess on: html [
	Smalltalk at: #WAInspector ifPresent: [ :inspectorClass |
		inspectorClass current notNil ifTrue: [
			html anchor
				callback: [ self show: (inspectorClass current on: aProcess) ];
				with: 'inspect' ] ]
]

{ #category : #rendering }
WAProcessStatus >> renderProcess: aProcess on: html [
	html tableRow: [
		self renderLabel: aProcess name on: html.
		self renderValue: aProcess priority on: html.
		self renderValue: aProcess printString on: html.
		self
			renderValue: [ self renderTerminate: aProcess on: html ]
			on: html.
		self
			renderValue: [ self renderSignalSemaphore: aProcess on: html ]
			on: html.
		self
			renderValue: [ self renderInspect: aProcess on: html ]
			on: html ]
]

{ #category : #rendering }
WAProcessStatus >> renderSignalSemaphore: aProcess on: html [
	(self isWaitingOnSemaphore: aProcess) ifTrue: [
		html anchor
			callback: [ self signalSemaphore: aProcess ];
			with: 'signal semaphore' ]
]

{ #category : #rendering }
WAProcessStatus >> renderTerminate: aProcess on: html [
	html anchor
		callback: [ aProcess terminate ];
		with: 'terminate'
]

{ #category : #rendering }
WAProcessStatus >> renderValuesOn: html [
	self processes do: [ :each |
		self renderProcess: each on: html ]
]

{ #category : #actions }
WAProcessStatus >> signalSemaphore: aProcess [
	(self isWaitingOnSemaphore: aProcess)
		ifFalse: [ ^ self ].
	"there is a potential race condition here because of check-then-act but we don't care about this"
	[ aProcess suspendingList signal ] fork
]

{ #category : #accessing }
WAProcessStatus >> title [
	^ 'Processes'
]
