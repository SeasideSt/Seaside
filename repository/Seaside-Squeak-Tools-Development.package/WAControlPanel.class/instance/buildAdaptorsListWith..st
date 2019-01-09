building
buildAdaptorsListWith: builder

	^ builder pluggableListSpec new
		model: self;
		list: #adaptorsList; 
		getIndex: #adaptorsListIndex; 
		setIndex: #adaptorsListIndex:;
		icon: #iconForIndex:;
		menu: #adaptorsMenu:; 
"		keyPress: #adaptorsListKey:from:;

"
		yourself