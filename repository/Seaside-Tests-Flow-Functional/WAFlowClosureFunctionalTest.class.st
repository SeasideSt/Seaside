Class {
	#name : #WAFlowClosureFunctionalTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Flow-Functional'
}

{ #category : #actions }
WAFlowClosureFunctionalTest >> ensure [
	[ self go ] ensure: [ self inform: 'ensure' ]
]

{ #category : #actions }
WAFlowClosureFunctionalTest >> go [
	(1 to: 3) do: [ :index | self inform: index ]
]

{ #category : #rendering }
WAFlowClosureFunctionalTest >> renderContentOn: html [
	html paragraph: 'The following two anchors should trigger a 3 step flow. Backtracking and spawning of windows should properly work.'.
	html paragraph: [
		html anchor
			callback: [ self go ];
			with: 'Go' ].

	html paragraph 
		style: 'color: red; font-weight: bold';
		with: 'WARNING: FOLLOWING SECTION IS FOR DEVELOPERS ONLY'.
	html paragraph: [
		html text: 'The "Go with ensure" test is '.
		html span style: 'color:red; font-weight:bold'; with: 'expected to fail'.
		html text: ' right now, as the ensure fires during rendering. The ensure does not survive across continuations at the present time.' ].
	html paragraph: [
		html anchor
			callback: [ self ensure ];
			with: 'Go with ensure' ]
]
