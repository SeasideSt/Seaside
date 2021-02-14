Class {
	#name : #WAOpenHandlerPlugin,
	#superclass : #WAConfigurationToolPlugin,
	#category : 'Seaside-Tools-Web'
}

{ #category : #actions }
WAOpenHandlerPlugin >> execute [
	self requestContext redirectTo: self handler url

]

{ #category : #testing }
WAOpenHandlerPlugin >> isActive [
	^ self handler notNil
]

{ #category : #accessing }
WAOpenHandlerPlugin >> label [
	^ 'Open'
]

{ #category : #accessing }
WAOpenHandlerPlugin >> priority [
	^ 10
]
