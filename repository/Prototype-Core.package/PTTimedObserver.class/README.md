This is an abstract class which corresponds to the class Abstract.TimedObserver in the prototype.js library.

All of the prototype.js observers watch an element (specified by #id) at a particular #frequency and evaluate a javascript #function if the element has changed. The function takes two arguments, element (the element that changed) and value (the new value).

So the simplest use of an observer looks something like this:

html textInput id: 'watchMe'.
html script: (html formElementObserver
	id: 'watchMe';
	frequency: 2 seconds;
	function: 'alert(value)')

or you can put something more interesting in the function, e.g.:

	function: (html updater ... )
