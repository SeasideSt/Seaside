WAChoiceDialog produces a form with select tag (dropdown menu) on a collection of options and "Ok" and "Cancel" buttons. Options can be any object. Returns actual object selected or nil if user select "Cancel". WAChoiceDialog is used to implement the chooseFrom:caption: convenience method in WAComponent.

	| selection |
	selection := WAChoiceDialog options: #('Smalltalk' 'Perl' 'Python' 'Ruby' 9).
	result := self call: selection.
	self inform: result printString

Instance Variables:
	options	<Collection of Objects> objects in list
	selection	<Object>	object selected by user or nil if user cancels

