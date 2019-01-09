building
buildInformationTextWith: builder 

	^ builder pluggableTextSpec new
		model: self;
		readOnly: true;
		indicateUnacceptedChanges: false;
		softLineWrap: false;
		getText: #information; 
		yourself