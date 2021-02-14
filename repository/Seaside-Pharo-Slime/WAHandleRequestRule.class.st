Class {
	#name : #WAHandleRequestRule,
	#superclass : #GRSlimeTransformationRule,
	#category : 'Seaside-Pharo-Slime'
}

{ #category : #running }
WAHandleRequestRule >> checkMethod: aContext [
	(WASlime class: aContext methodClass includesBehaviorNamed: #WARequestHandler)
		ifTrue: [ super checkMethod: aContext ]
]

{ #category : #accessing }
WAHandleRequestRule >> group [
	^ 'Seaside 3.0'
]

{ #category : #initialization }
WAHandleRequestRule >> initialize [
	super initialize.
	self rewriteRule
		replaceMethod: 'handleRequest: `aRequest | `@temps | `@.statements'
		withValueFrom: [ :node |
			RBParseTreeRewriter new
				replace: node arguments first name with: 'aRequestContext';
				executeTree: node.
			RBParseTreeRewriter new
				replace: 'aRequestContext' with: 'aRequestContext request';
				executeTree: node body.
			node
				selector: #handleFiltered:;
				arguments: (Array with: (RBVariableNode named: 'aRequestContext'));
				yourself ]
]

{ #category : #accessing }
WAHandleRequestRule >> name [
	^ 'Rename WARequestHandler>>#handleRequest: to #handleFiltered:'
]

{ #category : #accessing }
WAHandleRequestRule >> rationale [
	^ 'Rename #handleRequest: to #handleFiltered when moving to Seaside 3.0.'
]
