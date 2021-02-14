Class {
	#name : #JQTabs,
	#superclass : #JQWidget,
	#category : 'JQuery-UI-Widgets'
}

{ #category : #'options-generated' }
JQTabs >> active: aJSObject [
	"Which panel is currently open"

	self optionAt: 'active' put: aJSObject
]

{ #category : #'options-generated' }
JQTabs >> collapsible: aBoolean [
	"Set to true to allow an already selected tab to become unselected again upon reselection."

	self optionAt: 'collapsible' put: aBoolean
]

{ #category : #actions }
JQTabs >> destroy [
	"Removes the tabs functionality completely. This will return the element back to its pre-init state."
	
	self action: 'destroy'
]

{ #category : #actions }
JQTabs >> disable: anInteger [
	"=Disable a tab. The selected tab cannot be disabled. To disable more than one tab at once use: <code>$('#example').data('disabled.tabs', [1, 2, 3]);</code>  The second argument is the zero-based index of the tab to be disabled. "
	
	self action: 'disable' arguments: (Array with: anInteger)
]

{ #category : #'options-generated' }
JQTabs >> disabled: anArrayNumber [
	"An array containing the position of the tabs (zero-based index) that should be disabled on initialization."

	self optionAt: 'disabled' put: anArrayNumber
]

{ #category : #actions }
JQTabs >> enable: anInteger [
	"Enable a disabled tab.  To enable more than one tab at once reset the disabled property like: <code>$('#example').data('disabled.tabs', []);</code>. The second argument is the zero-based index of the tab to be enabled."
	
	self action: 'enable' arguments: (Array with: anInteger)
]

{ #category : #'options-generated' }
JQTabs >> event: aString [
	"The type of event to be used for selecting a tab."

	self optionAt: 'event' put: aString
]

{ #category : #'options-generated' }
JQTabs >> heightStyle: aString [
	"Controls the height of the tabs widget and each panel. Possible values: 
		'auto': All panels will be set to the height of the tallest panel. 
		'fill': Expand to the available height based on the tabs' parent height.
		'content': Each panel will be only as tall as its content."

	self optionAt: 'heightStyle' put: aString
]

{ #category : #'options-generated' }
JQTabs >> hide: aJSObject [
	"If and how to animate the hiding of the panel"

	self optionAt: 'hide' put: aJSObject
]

{ #category : #actions }
JQTabs >> load: anInteger [
	"Reload the content of an Ajax tab programmatically. This method always loads the tab content from the remote location, even if cache is set to true. The second argument is the zero-based index of the tab to be reloaded."
	
	self action: 'load' arguments: (Array with: anInteger)
]

{ #category : #accessing }
JQTabs >> method [
	^ 'tabs'
]

{ #category : #'events-generated' }
JQTabs >> onActivate: anObject [
	"Triggered after a tab has been activated (after animation completes). If the tabs were previously collapsed, ui.oldTab and ui.oldPanel will be empty jQuery objects. If the tabs are collapsing, ui.newTab and ui.newPanel will be empty jQuery objects."

	self optionAt: 'activate' put: anObject asFunction
]

{ #category : #'events-generated' }
JQTabs >> onBeforeActivate: anObject [
	"Triggered immediately before a tab is activated. Can be canceled to prevent the tab from activating. If the tabs are currently collapsed, ui.oldTab and ui.oldPanel will be empty jQuery objects. If the tabs are collapsing, ui.newTab and ui.newPanel will be empty jQuery objects."

	self optionAt: 'beforeActivate' put: anObject asFunction
]

{ #category : #'events-generated' }
JQTabs >> onBeforeLoad: anObject [
	"Triggered when a remote tab is about to be loaded, after the beforeActivate event. Can be canceled to prevent the tab panel from loading content; though the panel will still be activated. This event is triggered just before the Ajax request is made, so modifications can be made to ui.jqXHR and ui.ajaxSettings."

	self optionAt: 'beforeload' put: anObject asFunction
]

{ #category : #'events-generated' }
JQTabs >> onCreate: anObject [
	"Triggered when the tabs are created. If the tabs are collapsed, ui.tab and ui.panel will be empty jQuery objects."

	self optionAt: 'create' put: anObject asFunction
]

{ #category : #'events-generated' }
JQTabs >> onLoad: anObject [
	"This event is triggered after the content of a remote tab has been loaded."

	self optionAt: 'load' put: anObject asFunction
]

{ #category : #actions }
JQTabs >> refresh [
	"Process any tabs that were added or removed directly in the DOM and recompute the height of the tab panels. "
	
	self action: 'refresh'
]

{ #category : #'options-generated' }
JQTabs >> show: aJSObject [
	"If and how to animate the showing of the panel"

	self optionAt: 'show' put: aJSObject
]
