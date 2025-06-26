*Seaside-HotwireTurbo-Core
turboConfirm: aString
	"Decorate links with both data-turbo-confirm and data-turbo-method,
	and confirmation will be required for a visit to proceed.
	https://turbo.hotwired.dev/handbook/drive#requiring-confirmation-for-a-visit"

	self turboMethod: 'get'.
	self dataAttributeAt: 'turbo-confirm' put: aString
