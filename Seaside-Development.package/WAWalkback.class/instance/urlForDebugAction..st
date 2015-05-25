private
urlForDebugAction: aString
	| copy |
	copy := self requestContext request url copy.
	"We don't use #withField:value: or #addField:value: because we want to replace existing fields, not add to them.
	For example _fullStack may already be present and we want to set _debug."
	copy queryFields at: self debugActionField put: aString.
	^ copy