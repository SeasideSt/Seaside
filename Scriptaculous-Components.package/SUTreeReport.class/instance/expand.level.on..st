scripts
expand: anObject level: anInteger on: aScript
	| children parentId |
	children := childrenBlock value: anObject.
	children isEmpty ifTrue: [ ^ self ].
	parentId := self uid: anObject on: aScript.
	aScript prototype element
		id: parentId; 
		down: '.indent a';
		addClassName: 'expanded'.
	aScript prototype insertion
		id: parentId;
		after: [ :html | 
			children do: [ :each |
				self renderRow: each level: anInteger + 1 on: html ] ].
	expanded add: anObject