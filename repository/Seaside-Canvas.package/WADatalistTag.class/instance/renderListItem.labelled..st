private
renderListItem: anObject labelled: labelString
	canvas option
		value: (self valueFor: anObject);
		selected: (self isSelected: anObject);
		with: labelString