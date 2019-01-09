initialization
buildTaskList
	"self buildTaskList"

	(self class allSelectors select: [:ea | ea beginsWith: 'serviceVMTask' ]) do:[:selector | | task |
		task := self perform: selector.
		"add task only if it isn't already in task list"
		self taskNamed: task name ifAbsent: [ self tasks add: task ]].