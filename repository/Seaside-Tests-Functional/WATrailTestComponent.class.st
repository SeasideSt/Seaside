Class {
	#name : #WATrailTestComponent,
	#superclass : #WAComponent,
	#instVars : [
		'count'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #accessing }
WATrailTestComponent >> count: aNumber [
	count := aNumber
]

{ #category : #initialization }
WATrailTestComponent >> initialize [
	super initialize.
	count := 1
]

{ #category : #rendering }
WATrailTestComponent >> renderContentOn: html [
	html heading
		level: 1;
		with: self trailName.

	html anchor
		callback: [ self show: (self class new count: count+1; yourself) ];
		with: 'Call'.
		
	html space.
		
	html anchor
		callback: [ self answer ];
		with: 'Answer'
]

{ #category : #accessing }
WATrailTestComponent >> trailName [
	^ 'Item ' , count greaseString , ' (' , self identityHash greaseString , ')'
]
