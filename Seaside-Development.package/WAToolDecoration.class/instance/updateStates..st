updating
updateStates: aSnapshot
	super updateStates: aSnapshot.
	"Create halos for all visible presenters at the end of the action phase so that we
	can properly snapshot their initial values (otherwise they get created in the render
	phase and we have no snapshot of the state for that render)."
	self showHalos ifTrue: [ self visiblePresentersDo: [ :each | self haloFor: each ] ].
	aSnapshot register: halos.
	halos do: [ :each  | each updateStates: aSnapshot ]