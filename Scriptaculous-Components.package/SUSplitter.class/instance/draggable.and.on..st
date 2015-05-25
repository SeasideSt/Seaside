scripts
draggable: aBeforeItem and: anAfterItem on: html
	^ html scriptaculous draggable
		revert: true;
		endEffect: nil;
		startEffect: nil;
		onStart: ((JSStream on: 'var splitter = drag.element;',
								self initOffsetScript ,'
								drag._previous = splitter.previous();
								drag._next = splitter.next();')
			asFunction: #(drag))