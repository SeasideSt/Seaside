rendering
renderContentOn: html
	uids := IdentityDictionary new.
	html table 
		cellspacing: 0;
		class: self cssClass;
		with: [ self renderTableOn: html ]