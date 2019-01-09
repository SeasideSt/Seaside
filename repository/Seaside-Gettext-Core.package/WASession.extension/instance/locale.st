*seaside-gettext-core
locale
	^ self properties
		at: #gettextLocale
		ifAbsentPut: [ self defaultLocale ]