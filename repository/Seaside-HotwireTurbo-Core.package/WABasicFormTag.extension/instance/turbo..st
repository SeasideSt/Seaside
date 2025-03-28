*Seaside-HotwireTurbo-Core
turbo: aBoolean

	"data-turbo=""false"" disables Turbo Drive on links and forms including descendants. To reenable when an ancestor has opted out, use data-turbo=""true"". Be careful: when Turbo Drive is disabled, browsers treat link clicks as normal, but native adapters may exit the app."

	self dataAttributeAt: 'turbo' put: aBoolean