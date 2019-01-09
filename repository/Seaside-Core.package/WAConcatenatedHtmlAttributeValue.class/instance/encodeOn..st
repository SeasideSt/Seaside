printing
encodeOn: aDocument 
	values
		do: [ :each | aDocument print: each ]
		separatedBy: [ aDocument print: separator ]