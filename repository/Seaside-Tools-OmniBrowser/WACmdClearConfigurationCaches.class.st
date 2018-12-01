Class {
	#name : #WACmdClearConfigurationCaches,
	#superclass : #OBCommand,
	#category : 'Seaside-Tools-OmniBrowser-Commands'
}

{ #category : #execution }
WACmdClearConfigurationCaches >> execute [
	WAAdmin clearConfigurationCaches
]

{ #category : #testing }
WACmdClearConfigurationCaches >> group [
	^ #manager
]

{ #category : #testing }
WACmdClearConfigurationCaches >> isActive [
	^ requestor isSelected: target
]

{ #category : #accessing }
WACmdClearConfigurationCaches >> label [
	^ 'Clear configuration caches'
]
