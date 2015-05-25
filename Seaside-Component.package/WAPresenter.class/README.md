WAPresenter holds the functionality that is common to WAComponent and WADecoration. Subclasses of this class may have state and can be stored in instance variables of other Presenters.

You might want to subclass WAPresenter if you do not need the special abilities (decoration and call/answer) of WAComponent but do need one or more of the following:

	+ The ability to specify objects whose state should be backtracked (#states)
	+ The ability to provide CSS and JavaScript for the component (#style, #script)
	+ The ability to "embed" other persistent Presenters within this one (#children)

WAPresenter does not support call/answer or the addition of Decorations. If you need either of these features, you should subclass WAComponent instead.

Child Presenters:
It is common for a Presenter to display instances of other Presenters while rendering itself.  It does this by passing them into the #render: method of a renderer (typically an instance of WACanvas).  For example, this #renderContentOn: method simply renders a heading and then displays a counter component 
immediately below it:

	renderContentOn: html
		html heading level3; with: 'My Counter'.
		html render: myCounter.

It's important that you use #render:, rather than directly calling the #renderContentOn: method of the subcomponent. The following is *not* correct:

	renderContentOn: html
		html heading level3; with: 'My Counter'.
		myCounter renderContentOn: html.   "DON'T DO THIS".

These sub-Presenters are usually instance variables of the Presenter that is "embedding" them.  They are commonly created as part of the Presenter's #initialize method:

	initialize
		myCounter := WACounter new.

They may also be stored in a collection. One fairly common pattern is to keep a lazily initialized dictionary of sub-presenters that match a collection of model items. For example, if you wanted a BudgetItemRow subcomponent for each member of budgetItems, you might do something like this:

	initialize
		budgetRows := Dictionary new.

	rowForItem: anItem
		^budgetRows at: anItem ifAbsentPut: [ BudgetItemRow item: anItem ].

	renderContentOn: html
		self budgetItems
			do: [ :each | html render: (self rowForItem: each) ]
			separatedBy: [ html horizontalLine ].

Each parent Presenter *must* implement a #children method that returns a collection of all of the sub-Presenters that it might display on the next render. For the above two examples, #children might look like this:

	children
		^Array with: myCounter

or this:

	children
		^self budgetItems collect: [ :each | self rowForItem: each ].
		
Visibility:
A Presenter is visible if it is:
- the root of an application
- a child of a visible Presenter (returned by #children) that has not been #call:'d