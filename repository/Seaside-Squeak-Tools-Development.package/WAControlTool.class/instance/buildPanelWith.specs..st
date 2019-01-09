building
buildPanelWith: builder specs: specs
	| panelSpec |
	panelSpec := builder pluggablePanelSpec new.
	panelSpec children: OrderedCollection new.
	specs do:[ :assoc | | action widgetSpec rect |
		rect := assoc key.
		action := assoc value.
		widgetSpec := action value.
		widgetSpec ifNotNil:[
			widgetSpec frame: rect.
			panelSpec children add: widgetSpec]].
	^panelSpec