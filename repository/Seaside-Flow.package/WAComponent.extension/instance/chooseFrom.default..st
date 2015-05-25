*seaside-flow-dialog
chooseFrom: aCollection default: anObject
	"Choose an item from the given aCollection and the default anObject. Answer the selected item."

	^ self wait: [ :cc | self chooseFrom: aCollection default: anObject onAnswer: cc ]