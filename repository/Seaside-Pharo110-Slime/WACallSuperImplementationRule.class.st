Class {
	#name : 'WACallSuperImplementationRule',
	#superclass : 'GRReSlimeBlockLintRule',
	#instVars : [
		'classesAndSelectors'
	],
	#category : 'Seaside-Pharo110-Slime',
	#package : 'Seaside-Pharo110-Slime'
}

{ #category : 'testing - interest' }
WACallSuperImplementationRule class >> checksMethod [

	^ true
]

{ #category : 'running' }
WACallSuperImplementationRule >> basicCheck: aMethod [

	| current superSelectors |
	aMethod methodClass isMeta
		ifTrue: [ ^ false ].

	superSelectors := Set new.
	current := aMethod methodClass superclass.
	[ current isNil ] whileFalse: [
		classesAndSelectors
			at: current name
			ifPresent: [ :values | superSelectors addAll: values ].
		current := current superclass ].
		
	^ ((superSelectors includes: aMethod selector)
		and: [ (aMethod superMessages includes: aMethod selector) not ])
]

{ #category : 'accessing' }
WACallSuperImplementationRule >> group [

	^ 'Seaside'
]

{ #category : 'initialization' }
WACallSuperImplementationRule >> initialize [

	super initialize.
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

{ #category : 'accessing' }
WACallSuperImplementationRule >> name [

	^ 'Call super implementation'
]

{ #category : 'accessing' }
WACallSuperImplementationRule >> rationale [

	^ 'Some template methods provided by the framework require to call super to work correctly.'
]
