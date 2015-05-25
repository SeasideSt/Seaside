rendering
renderToolsOn: html
	html paragraph: [
		"Ok, this is hack. This component can either be #call:ed or #render:ed directly (in which case it isn't really a component).
		This it to be used in cases where you can't #call: (eg in the render phase). In that case we just render links without #callback:s.
		However this doesn't work always either (eg. in a POST) so in these cases we #call:."
		self canAnswer
			ifTrue: [ self renderAnsweringToolsOn: html ]
			ifFalse: [ self renderNotAnsweringToolsOn: html ] ]