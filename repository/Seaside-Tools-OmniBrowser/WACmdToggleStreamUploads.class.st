Class {
	#name : #WACmdToggleStreamUploads,
	#superclass : #OBCommand,
	#category : 'Seaside-Tools-OmniBrowser-Commands'
}

{ #category : #'user interface' }
WACmdToggleStreamUploads >> addItemToMenu: aMenu [
	"Hack. Must nuke the default blankIcon used by OB."

	super addItemToMenu: aMenu.
	self isActive
		ifFalse: [ ^ self ].
	aMenu lastItem icon: nil
]

{ #category : #execution }
WACmdToggleStreamUploads >> execute [
	target adaptor streamUploads: target adaptor streamUploads not.
	requestor browser signalRefresh
]

{ #category : #testing }
WACmdToggleStreamUploads >> isActive [
	^ (requestor isSelected: target)
		and: [ target isStopped
		and: [ target canChangeStreamUploads ] ]
]

{ #category : #accessing }
WACmdToggleStreamUploads >> label [
	^ target isStreamingUploads
		ifTrue: [ '<on>Stream uploads' ]
		ifFalse: [ '<off>Stream uploads' ]
]
