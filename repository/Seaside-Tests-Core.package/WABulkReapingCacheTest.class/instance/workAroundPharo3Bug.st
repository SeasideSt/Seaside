private
workAroundPharo3Bug
	"apparently the first delay you execute in a Pharo 3 image gets ignored
	fixed in Pharo 4"
	(Delay forMilliseconds: 1) wait