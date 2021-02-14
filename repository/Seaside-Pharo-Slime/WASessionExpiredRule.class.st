Class {
	#name : #WASessionExpiredRule,
	#superclass : #GRSlimeTransformationRule,
	#category : 'Seaside-Pharo-Slime'
}

{ #category : #running }
WASessionExpiredRule >> checkMethod: aContext [
	(WASlime class: aContext methodClass includesBehaviorNamed: #WASession)
		ifTrue: [ super checkMethod: aContext ]
]

{ #category : #accessing }
WASessionExpiredRule >> group [
	^ 'Seaside 3.0'
]

{ #category : #initialization }
WASessionExpiredRule >> initialize [
	super initialize.
	self rewriteRule
		replaceMethod: 'expired
			| `@temps | 
			`@.Statements'
		with: 'unregistered
			| `@temps | 
			`@.Statements'
]

{ #category : #accessing }
WASessionExpiredRule >> name [
	^ 'Rename WASession>>#expired to #unregistered'
]

{ #category : #accessing }
WASessionExpiredRule >> rationale [
	^ 'Rename #expired to #unregisterd when moving to Seaside 3.0.'
]
