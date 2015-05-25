tools
renamePackage: oldPackageName to: newPackageName
	"self renamePackage: 'Seaside-Squeak-Development-Core' to: 'Seaside-Pharo-Development-Core'"
	
	| oldPackage newPackage oldWorkingCopy newWorkingCopy |
	oldPackage := PackageInfo named: oldPackageName.
	newPackage := PackageInfo named: newPackageName.
	
	" rename system categories "
	oldPackage systemCategories do: [ :oldCategory |
		| newCategory |
		newCategory := oldCategory allButFirst: oldPackage systemCategoryPrefix size.
		Smalltalk organization renameCategory: oldCategory toBe: newPackage systemCategoryPrefix, newCategory ].
	
	" rename method categories "
	oldPackage extensionClasses do: [ :extensionClass |
		(oldPackage extensionCategoriesForClass: extensionClass) do: [ :oldProtocol |
			| newProtocol |
			newProtocol := oldProtocol allButFirst: oldPackage methodCategoryPrefix size.
			extensionClass organization renameCategory: oldProtocol toBe: newPackage methodCategoryPrefix , newProtocol ] ].
	
	" update monticello packages "
	oldWorkingCopy := MCWorkingCopy forPackage: (MCPackage named: oldPackageName).
	newWorkingCopy := MCWorkingCopy forPackage: (MCPackage named: newPackageName).
	newWorkingCopy repositoryGroup: oldWorkingCopy repositoryGroup; modified: true.
	
	" test is all methos have been caught "
	oldPackage methods isEmpty
		ifTrue: [ oldWorkingCopy unload. PackageOrganizer default unregisterPackage: oldPackage ]
		ifFalse: [ self error: 'Some code entities remain in the old package, please migrate manually.' ]