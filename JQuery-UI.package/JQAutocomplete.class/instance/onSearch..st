events-generated
onSearch: anObject
	"Before a request (source-option) is started, after minLength and delay are met. Can be canceled (return false), then no request will be started and no items suggested."

	self optionAt: 'search' put: anObject asFunction