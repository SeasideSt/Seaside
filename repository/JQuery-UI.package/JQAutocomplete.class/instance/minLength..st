options-generated
minLength: anInteger
	"The minimum number of characters a user has to type before the Autocomplete activates. Zero is useful for local data with just a few items. Should be increased when there are a lot of items, where a single character would match a few thousand items."

	self optionAt: 'minLength' put: anInteger