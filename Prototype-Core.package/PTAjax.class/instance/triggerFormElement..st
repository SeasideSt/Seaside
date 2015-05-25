triggers
triggerFormElement: aString
	"Serializing a form element and trigger its associated callback. Note that this might not work for all form elements as one would expect: (1) check-boxes and multi-select lists do not work as Seaside internally depends on other hidden form elements. (2) submit-button callbacks are ignored, instead use the normal callback to trigger specific code evaluation."

	self addParameter: (PTFormElement new
		id: aString;
		serialize)