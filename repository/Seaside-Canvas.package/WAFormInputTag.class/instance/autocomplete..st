attributes
autocomplete: aString
	"User agents sometimes have features for helping users fill forms in, for example prefilling the user's address based on earlier user input. The autocomplete content attribute can be used to hint to the user agent how to, or indeed whether to, provide such a feature."
	self attributes 
		at: 'autocomplete'
		append: aString