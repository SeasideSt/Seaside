private
detectCommonPathElementClass
	"Detect if all path elements are of the same class. Answer that class if that is the case.
	Answer nil otherwise.
	
	If all the elements are of the same class we can avoid sending #contents to the wirte stream
	because we can allocate a collection of the right size and type. This is important because
	#contents does an additional copy which shows up in benchmarks.
	If the lements are not of the same class we can not know the type of the target collection
	(in a portable way) and have to use stream #contents."
	| firstSpecies |
	path isEmptyOrNil ifTrue: [
		^ '' species ].
	firstSpecies := (path at: 1) species.
	2 to: path size do: [ :index |
		(path at: index) species ~= firstSpecies
			ifTrue: [ ^ nil ] ].
	^ firstSpecies