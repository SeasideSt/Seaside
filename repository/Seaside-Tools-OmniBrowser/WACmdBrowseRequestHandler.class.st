Class {
	#name : #WACmdBrowseRequestHandler,
	#superclass : #OBCommand,
	#category : 'Seaside-Tools-OmniBrowser-Commands'
}

{ #category : #execution }
WACmdBrowseRequestHandler >> execute [
	(WAHandlerBrowser metaNode: WAHandlerBrowser adaptorMetaNode node: target copy) open
]

{ #category : #accessing }
WACmdBrowseRequestHandler >> group [
	^ #browsing
]

{ #category : #testing }
WACmdBrowseRequestHandler >> isActive [
	^ requestor isSelected: target
]

{ #category : #accessing }
WACmdBrowseRequestHandler >> keystroke [
	^ $b
]

{ #category : #accessing }
WACmdBrowseRequestHandler >> label [
	^ 'Browse'
]
