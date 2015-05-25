hooks
children
	"This method is really important. It should return a collection of all sub-presenters that will (or might) be rendered in #renderContentOn:. Components that are displayed using #call: are *not* children.

	If the contents returned by this method change over time make sure to return them in #states as well, otherwise the back button will fail."

	^ #()