options
global: aBoolean
	"Whether to trigger global Ajax event handlers for this request. The default is true. Set to false to prevent the global handlers like ajaxStart or ajaxStop from being triggered. This can be used to control various Ajax Events."
	
	self optionAt: 'global' put: aBoolean