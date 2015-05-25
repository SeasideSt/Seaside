*seaside-flow-dialog
chooseFrom: aCollection
	"Choose an item from the given aCollection. Answer the selected item."

	^ self wait: [ :cc | self chooseFrom: aCollection onAnswer: cc ]