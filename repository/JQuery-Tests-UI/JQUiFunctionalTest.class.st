Class {
	#name : #JQUiFunctionalTest,
	#superclass : #JQFunctionalTest,
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #accessing }
JQUiFunctionalTest >> berries [
	"A collection of berries and a short description from Wikipedia."
	
	^ Dictionary new
		at: 'Blackberry' put: 'The blackberry is an aggregate fruit from a bramble bush, genus Rubus in the rose family Rosaceae.';
		at: 'Raspberry' put: 'The raspberry is the edible fruit of a multitude of plant species in the subgenus Idaeobatus of the genus Rubus.';
		at: 'Blueberry' put: 'Blueberries are flowering plants in the genus Vaccinium, sect. Cyanococcus.'; 
		at: 'Cloudberry' put: 'The cloudberry is a slow-growing alpine or sub-Arctic species of Rubus, producing amber-colored edible fruit.';
		at: 'Cranberry' put: 'Cranberries are a group of evergreen dwarf shrubs or trailing vines in the genus Vaccinium subgenus Oxycoccos, or in some treatments, in the distinct genus Oxycoccos.';
		yourself
]

{ #category : #rendering }
JQUiFunctionalTest >> renderBoxOn: html [
	html div class: 'pack'; with: [
		html div 
			class: 'box';
			class: 'blue' ]
]

{ #category : #accessing }
JQUiFunctionalTest >> vegetables [
	^ #('Alfalfa' 'Clover' 'Peas' 'Beans' 'Lentils' 'Lupins' 'Peanuts')
]
