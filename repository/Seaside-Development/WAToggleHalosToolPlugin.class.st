"
I toggle halos on and off.
"
Class {
	#name : #WAToggleHalosToolPlugin,
	#superclass : #WAToolPlugin,
	#category : 'Seaside-Development-Plugins'
}

{ #category : #actions }
WAToggleHalosToolPlugin >> execute [
	 self requestor toggleHalos
]

{ #category : #accessing }
WAToggleHalosToolPlugin >> label [
	^ 'Halos'
]

{ #category : #accessing }
WAToggleHalosToolPlugin >> priority [
	^ 300
]
