Class {
	#name : #SUHorizontalSplitter,
	#superclass : #SUSplitter,
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #accessing }
SUHorizontalSplitter >> cssClass [
	^ 'splitter-horizontal'
]

{ #category : #scripts }
SUHorizontalSplitter >> draggable: aBeforeItem and: anAfterItem on: html [ 
	^ (super 
		draggable: aBeforeItem
		and: anAfterItem
		on: html)
		constraintVertical;
		onDrag: (JSStream on: '
				var splitter = arguments[0].element;
				offset = splitter.offsetTop - arguments[0]._originalTop;
				arguments[0]._originalTop = splitter.offsetTop;
				leftElement = arguments[0]._previous;
				leftHeight = leftElement.offsetHeight + offset;
				rightElement = arguments[0]._next;
				rightHeight = rightElement.offsetHeight - offset;
				if (leftHeight > ' , aBeforeItem min greaseString , ' && rightHeight > ' , anAfterItem min greaseString , ') {
					leftElement.style.height = leftHeight + "px";
					rightElement.style.height = rightHeight + "px";
				}');
		onEnd: (html prototype request
				callback: [ :value | aBeforeItem size: value ]
					value: (JSStream on: 'arguments[0].element.previous().offsetHeight + ''px''');
				callback: [ :value | anAfterItem size: value ]
					value: (JSStream on: 'arguments[0].element.next().offsetHeight + ''px'''))
]

{ #category : #scripts }
SUHorizontalSplitter >> initOffsetScript [
	^ 'drag._originalTop=splitter.offsetTop;'
]

{ #category : #rendering }
SUHorizontalSplitter >> renderItem: anItem on: html [
	html div style: 'height:' , anItem size; with: anItem body
]
