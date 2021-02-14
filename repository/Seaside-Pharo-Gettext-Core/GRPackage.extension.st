Extension { #name : #GRPackage }

{ #category : #'*seaside-pharo-gettext-core' }
GRPackage class >> seasidePharoGettextCore [
	^ self new
		name: 'Seaside-Pharo-Gettext-Core';
		description: 'i18n and l10n using gettext';
		url: #seasideAddonsUrl;
		yourself
]
