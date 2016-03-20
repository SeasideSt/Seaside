development support
scriptToCopyMczs
|filter latest source destination goSource goDestination|
"Sample script to copy all the latest package versions from one repository to another"

source := (Smalltalk at: #MCSmalltalkhubRepository)
     owner: 'Seaside'
     project: 'Seaside31'
     user: ''
     password: ''.

destination := (Smalltalk at: #MCSmalltalkhubRepository)
     owner: 'Seaside'
     project: 'Seaside32'
     user: ''
     password: ''.
"Do not copy the packages for which the following block returns true"
filter := [ :r | r packageName beginsWith: 'Grease'].

goSource := Gofer new repository: source.
goDestination := Gofer new repository: destination.
latest := Dictionary new.
((source goferReferences
	reject: filter)
		groupedBy:[:r | r packageName]) 
			keysAndValuesDo:[:packageName :versions |
					latest 
						at: packageName 
						put: (versions sorted:[:v1 :v2 | v1 versionNumber <= v2 versionNumber]) last].
latest values do:[:version | 
	goSource version: version name. 
	goDestination version: version name].

goSource fetch.
goDestination push