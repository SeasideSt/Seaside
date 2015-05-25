scripting
scriptMove: anInteger for: id on: script
	"hide buttons to avoid clicks between move operation, works only for IE and firefox"
	
	| currentIndex nextIndex direction buttonId |
	currentIndex := self lastOffset. 
	anInteger = 1 
			ifTrue: [
				offset = 1 ifTrue: [ ^ self ].
				offset := offset - scrollInc.
				direction := '_prev' ]
			ifFalse: [ (offset + scrollInc abs) > (items size) ifTrue: [ ^ self ].
				direction := '_next'.
				offset := offset + scrollInc ].
	anInteger < 0 ifTrue: [
		nextIndex := (currentIndex + scrollInc) min: (items size).
		nextIndex > currentIndex ifTrue: [
		currentIndex + 1 to: nextIndex do: [ :idx |
			| anItem |
			anItem := items at: idx.
			(created includes: anItem) ifFalse: [
				created add: anItem.
				script prototype element
					id: (self uid: 'head' at: idx);
					then: (script prototype element
						id: (self uid: 'head' at: idx - 1);
						insertAfter: [ :html | 
							self renderElement: (items at: idx) index: idx on: html ]) ] ] ] ].
	buttonId := uid,direction.
	script prototype element
		id: buttonId;
		styleAt: 'visibility' put: 'hidden'.
	script scriptaculous effect id: id;
		duration: animationSpeed;
		y: (self moveSizeY: anInteger); x: (self moveSizeX: anInteger);
		move;
		onAfterFinish: (PTElement new id: buttonId; styleAt: 'visibility' put: 'visible')
