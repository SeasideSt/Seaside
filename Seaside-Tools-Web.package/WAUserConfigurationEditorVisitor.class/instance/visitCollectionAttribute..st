visiting
visitCollectionAttribute: anAttribute 
	| attributeCollection listSize |
	attributeCollection := self configuration currentCollectionAt: anAttribute key.
	attributeCollection isEmpty ifTrue: [ ^ self html text: '(none)' ].
	listSize := (attributeCollection size min: 10) max: 2.
	self html select
		size: listSize;
		title: 'Current';
		labels: [ :each | each value greaseString , ' [' , each key greaseString , ']' ];
		list: attributeCollection