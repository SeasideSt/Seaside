Extension { #name : #MessageNotUnderstood }

{ #category : #'*Seaside-Core' }
MessageNotUnderstood >> seasidePossibleCauses [
	| causes |
	self receiver isNil ifFalse: [
		^ #('you sent a message this type of object doesn''t understand') ].
	causes := #(
		'the receiver of the message is nil'
		'a class extension hasn''t been loaded correctly'
		'you sent the wrong message' ) asOrderedCollection.
	self message selector = #contents ifTrue: [
		causes addFirst: 'you forgot to send "super initialize" in a initialize method of a component or task' ].
	^ causes
]
