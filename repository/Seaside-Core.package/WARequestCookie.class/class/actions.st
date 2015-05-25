accessing
actions
	^ Dictionary new
		at: '$Domain' put: [ :codec :cookie :value | cookie domain: value ];
		at: '$Path' put: [ :codec :cookie :value | cookie pathEncoded: value codec: codec ];
		at: '$Port' put: [ :codec :cookie :value | cookie setPorts: value ];
		yourself