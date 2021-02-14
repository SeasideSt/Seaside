Class {
	#name : #WACallSuperImplementationRule,
	#superclass : #GRSlimeBlockLintRule,
	#instVars : [
		'classesAndSelectors',
		'superSelectors'
	],
	#category : 'Seaside-Slime'
}

{ #category : #running }
WACallSuperImplementationRule >> checkClass: aContext [
	| current |
	superSelectors := Set new.
	aContext selectedClass isMeta
		ifTrue: [ ^ self ].
	current := aContext selectedClass superclass.
	[ current isNil ] whileFalse: [
		classesAndSelectors
			at: current name
			ifPresent: [ :values | superSelectors addAll: values ].
		current := current superclass ]
]

{ #category : #running }
WACallSuperImplementationRule >> checkMethod: aContext [
	aContext selectedClass isMeta
		ifTrue: [ ^ self ].
	((superSelectors includes: aContext selector)
		and: [ (aContext superMessages includes: aContext selector) not ])
			ifTrue: [ result addClass: aContext selectedClass selector: aContext selector ]
]

{ #category : #accessing }
WACallSuperImplementationRule >> group [
	^ 'Seaside'
]

{ #category : #initialization }
WACallSuperImplementationRule >> initialize [
	super initialize.
	superSelectors := Set new.
	classesAndSelectors := Dictionary new.
	classesAndSelectors
		at: #WAObject put: #( initialize postCopy );
		at: #WAPainter put: #( updateRoot: updateUrl: );
		at: #WAPresenter put: #( updateStates: initialRequest: );
		at: #WABrush put: #( setParent:canvas: with: );
		at: #WATagBrush put: #( before after openTag closeTag );
		at: #WARequestFilter put: #( handleFiltered: updateStates: );
		at: #WASession put: #( updateRoot: updateUrl: updateStates: )
]

{ #category : #accessing }
WACallSuperImplementationRule >> name [
	^ 'Call super implementation'
]

{ #category : #accessing }
WACallSuperImplementationRule >> rationale [
	^ 'Some template methods provided by the framework require to call super to work correctly.'
]
