convenience
serializeThis
	"Serialize the receiving element. Note that this might not work for all form elements: (1) for check-boxes and multi-select lists Seaside internally depends on an additional hidden form element that is generated automatically, instead use #serializeThisWithHidden (2) submit-button callbacks are ignored, instead use a normal callback to trigger specific code evaluation."

	self serialize: self jQuery this