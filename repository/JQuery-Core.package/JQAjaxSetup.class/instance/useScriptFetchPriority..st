options
useScriptFetchPriority: aString
	"Configure script response handling and set the script fetchpriority attribute."

	self useScriptAttr: 'fetchpriority' value: aString