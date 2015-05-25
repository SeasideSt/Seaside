private
startTasks
	"Make sure that any new Tasks get executed"
	(WAVisiblePresenterGuide client: WATaskVisitor new) start: self presenter