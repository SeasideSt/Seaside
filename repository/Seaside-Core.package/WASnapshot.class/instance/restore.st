actions
restore
	"Restore all the backtracked states."

	objects keysAndValuesDo: [ :key :value | key restoreFromSnapshot: value ]