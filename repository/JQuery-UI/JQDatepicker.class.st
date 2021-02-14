"
A highly configurable plugin that adds datepicker functionality to your pages. You can restrict the functionality in various ways, you can select date ranges, and you can provide the date in picker in a number of languages.
"
Class {
	#name : #JQDatepicker,
	#superclass : #JQWidget,
	#category : 'JQuery-UI-Widgets'
}

{ #category : #'options-generated' }
JQDatepicker >> altField: aString [
	"The jQuery selector for another field that is to be updated with the selected date from the datepicker. Use the altFormat setting below to change the format of the date within this field. Leave as blank for no alternate field."

	self optionAt: 'altField' put: aString
]

{ #category : #'options-generated' }
JQDatepicker >> altFormat: aString [
	"The dateFormat to be used for the altField option. This allows one date format to be shown to the user for selection purposes, while a different format is actually sent behind the scenes. For a full list of the possible formats see the [[UI/Datepicker/formatDate"

	self optionAt: 'altFormat' put: aString
]

{ #category : #'options-generated' }
JQDatepicker >> appendText: aString [
	"The text to display after each date field, e.g. to show the required format."

	self optionAt: 'appendText' put: aString
]

{ #category : #'options-generated' }
JQDatepicker >> autoSize: aBoolean [
	"Set to true to automatically resize the input field to accomodate dates in the current [[UI/Datepicker#option-dateFormat"

	self optionAt: 'autoSize' put: aBoolean
]

{ #category : #'options-generated' }
JQDatepicker >> buttonImage: aString [
	"The URL for the popup button image. If set, button text becomes the 'alt' value and is not directly displayed."

	self optionAt: 'buttonImage' put: aString
]

{ #category : #'options-generated' }
JQDatepicker >> buttonImageOnly: aBoolean [
	"Set to true to place an image after the field to use as the trigger without it appearing on a button."

	self optionAt: 'buttonImageOnly' put: aBoolean
]

{ #category : #'options-generated' }
JQDatepicker >> buttonText: aString [
	"The text to display on the trigger button. Use in conjunction with 'showOn' equal to 'button' or 'both'."

	self optionAt: 'buttonText' put: aString
]

{ #category : #'options-generated' }
JQDatepicker >> calculateWeek: aFunction [
	"A function to calculate the week of the year for a given date. The default implementation uses the ISO 8601 definition: weeks start on a Monday; the first week of the year contains the first Thursday of the year."

	self optionAt: 'calculateWeek' put: aFunction
]

{ #category : #'options-generated' }
JQDatepicker >> changeMonth: aBoolean [
	"Allows you to change the month by selecting from a drop-down list. You can enable this feature by setting the attribute to true."

	self optionAt: 'changeMonth' put: aBoolean
]

{ #category : #'options-generated' }
JQDatepicker >> changeYear: aBoolean [
	"Allows you to change the year by selecting from a drop-down list. You can enable this feature by setting the attribute to true."

	self optionAt: 'changeYear' put: aBoolean
]

{ #category : #'options-generated' }
JQDatepicker >> closeText: aString [
	"The text to display for the close link. This attribute is one of the regionalisation attributes. Use the showButtonPanel to display this button."

	self optionAt: 'closeText' put: aString
]

{ #category : #'options-generated' }
JQDatepicker >> constrainInput: aBoolean [
	"True if the input field is constrained to the current date format."

	self optionAt: 'constrainInput' put: aBoolean
]

{ #category : #'options-generated' }
JQDatepicker >> currentText: aString [
	"The text to display for the current day link. This attribute is one of the regionalisation attributes. Use the showButtonPanel to display this button."

	self optionAt: 'currentText' put: aString
]

{ #category : #'options-generated' }
JQDatepicker >> dateFormat: aString [
	"The format for parsed and displayed dates. This attribute is one of the regionalisation attributes. For a full list of the possible formats see the [[UI/Datepicker/formatDate"

	self optionAt: 'dateFormat' put: aString
]

{ #category : #'options-generated' }
JQDatepicker >> dayNames: anArray [
	"The list of long day names, starting from Sunday, for use as requested via the dateFormat setting. They also appear as popup hints when hovering over the corresponding column headings. This attribute is one of the regionalisation attributes."

	self optionAt: 'dayNames' put: anArray
]

{ #category : #'options-generated' }
JQDatepicker >> dayNamesMin: anArray [
	"The list of minimised day names, starting from Sunday, for use as column headers within the datepicker. This attribute is one of the regionalisation attributes."

	self optionAt: 'dayNamesMin' put: anArray
]

{ #category : #'options-generated' }
JQDatepicker >> dayNamesShort: anArray [
	"The list of abbreviated day names, starting from Sunday, for use as requested via the dateFormat setting. This attribute is one of the regionalisation attributes."

	self optionAt: 'dayNamesShort' put: anArray
]

{ #category : #'options-generated' }
JQDatepicker >> defaultDate: aDateOrNumberOrString [
	"Set the date to highlight on first opening if the field is blank. Specify either an actual date via a Date object, or a number of days from today (e.g. +7) or a string of values and periods ('y' for years, 'm' for months, 'w' for weeks, 'd' for days, e.g. '+1m +7d'), or null for today."

	self optionAt: 'defaultDate' put: aDateOrNumberOrString
]

{ #category : #'options-generated' }
JQDatepicker >> duration: aStringOrNumber [
	"Control the speed at which the datepicker appears, it may be a time in milliseconds, a string representing one of the three predefined speeds ('slow', 'normal', 'fast'), or ' for immediately."

	self optionAt: 'duration' put: aStringOrNumber
]

{ #category : #'options-generated' }
JQDatepicker >> firstDay: aNumber [
	"Set the first day of the week: Sunday is 0, Monday is 1, ... This attribute is one of the regionalisation attributes."

	self optionAt: 'firstDay' put: aNumber
]

{ #category : #actions }
JQDatepicker >> getDate [
	"Get the current date for a date picker."
	
	self action: 'getDate'
]

{ #category : #'options-generated' }
JQDatepicker >> gotoCurrent: aBoolean [
	"If true, the current day link moves to the currently selected date instead of today."

	self optionAt: 'gotoCurrent' put: aBoolean
]

{ #category : #actions }
JQDatepicker >> hide [
	"Close a previously opened date picker."
	
	self action: 'hide'
]

{ #category : #'options-generated' }
JQDatepicker >> hideIfNoPrevNext: aBoolean [
	"Normally the previous and next links are disabled when not applicable (see minDate/maxDate). You can hide them altogether by setting this attribute to true."

	self optionAt: 'hideIfNoPrevNext' put: aBoolean
]

{ #category : #actions }
JQDatepicker >> isDisabled [
	"Determine whether a date picker has been disabled."
	
	self action: 'isDisabled'
]

{ #category : #'options-generated' }
JQDatepicker >> isRTL: aBoolean [
	"True if the current language is drawn from right to left. This attribute is one of the regionalisation attributes."

	self optionAt: 'isRTL' put: aBoolean
]

{ #category : #'options-generated' }
JQDatepicker >> maxDate: aDateOrNumberOrString [
	"Set a maximum selectable date via a Date object, or a number of days from today (e.g. +7) or a string of values and periods ('y' for years, 'm' for months, 'w' for weeks, 'd' for days, e.g. '+1m +1w'), or null for no limit."

	self optionAt: 'maxDate' put: aDateOrNumberOrString
]

{ #category : #accessing }
JQDatepicker >> method [
	^ 'datepicker'
]

{ #category : #'options-generated' }
JQDatepicker >> minDate: aDateOrNumberOrString [
	"Set a minimum selectable date via a Date object, or a number of days from today (e.g. +7) or a string of values and periods ('y' for years, 'm' for months, 'w' for weeks, 'd' for days, e.g. '-1y -1m'), or null for no limit."

	self optionAt: 'minDate' put: aDateOrNumberOrString
]

{ #category : #'options-generated' }
JQDatepicker >> monthNames: anArray [
	"The list of full month names, as used in the month header on each datepicker and as requested via the dateFormat setting. This attribute is one of the regionalisation attributes."

	self optionAt: 'monthNames' put: anArray
]

{ #category : #'options-generated' }
JQDatepicker >> monthNamesShort: anArray [
	"The list of abbreviated month names, for use as requested via the dateFormat setting. This attribute is one of the regionalisation attributes."

	self optionAt: 'monthNamesShort' put: anArray
]

{ #category : #'options-generated' }
JQDatepicker >> navigationAsDateFormat: aBoolean [
	"When true the formatDate function is applied to the prevText, nextText, and currentText values before display, allowing them to display the target month names for example."

	self optionAt: 'navigationAsDateFormat' put: aBoolean
]

{ #category : #'options-generated' }
JQDatepicker >> nextText: aString [
	"The text to display for the next month link. This attribute is one of the regionalisation attributes. With the standard ThemeRoller styling, this value is replaced by an icon."

	self optionAt: 'nextText' put: aString
]

{ #category : #'options-generated' }
JQDatepicker >> numberOfMonths: aNumberOrArray [
	"Set how many months to show at once. The value can be a straight integer, or can be a two-element array to define the number of rows and columns to display."

	self optionAt: 'numberOfMonths' put: aNumberOrArray
]

{ #category : #'events-generated' }
JQDatepicker >> onBeforeShow: anObject [
	"Can be a function that takes an input field and current datepicker instance and returns an options object to update the datepicker with. It is called just before the datepicker is displayed."

	self optionAt: 'beforeShow' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDatepicker >> onBeforeShowDay: anObject [
	"The function takes a date as a parameter and must return an array with [0] equal to true/false indicating whether or not this date is selectable, [1] equal to a CSS class name(s) or ' for the default presentation, and [2] an optional popup tooltip for this date. It is called for each day in the datepicker before it is displayed."

	self optionAt: 'beforeShowDay' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDatepicker >> onChangeMonthYear: anObject [
	"Allows you to define your own event when the datepicker moves to a new month and/or year. The function receives the selected year, month (1-12), and the datepicker instance as parameters. this refers to the associated input field."

	self optionAt: 'onChangeMonthYear' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDatepicker >> onClose: anObject [
	"Allows you to define your own event when the datepicker is closed, whether or not a date is selected. The function receives the selected date as text (' if none) and the datepicker instance as parameters. this refers to the associated input field."

	self optionAt: 'onClose' put: anObject asFunction
]

{ #category : #'events-generated' }
JQDatepicker >> onSelect: anObject [
	"Allows you to define your own event when the datepicker is selected. The function receives the selected date as text and the datepicker instance as parameters. this refers to the associated input field."

	self optionAt: 'onSelect' put: anObject asFunction
]

{ #category : #'options-generated' }
JQDatepicker >> prevText: aString [
	"The text to display for the previous month link. This attribute is one of the regionalisation attributes. With the standard ThemeRoller styling, this value is replaced by an icon."

	self optionAt: 'prevText' put: aString
]

{ #category : #'options-generated' }
JQDatepicker >> selectOtherMonths: aBoolean [
	"When true days in other months shown before or after the current month are selectable. This only applies if [[UI/Datepicker#option-showOtherMonths"

	self optionAt: 'selectOtherMonths' put: aBoolean
]

{ #category : #actions }
JQDatepicker >> setDate: aDate [
	"Set the current date for a date picker."
	
	self action: 'setDate' arguments: (Array with: aDate)
]

{ #category : #'options-generated' }
JQDatepicker >> shortYearCutoff: aStringOrNumber [
	"Set the cutoff year for determining the century for a date (used in conjunction with dateFormat 'y'). If a numeric value (0-99) is provided then this value is used directly. If a string value is provided then it is converted to a number and added to the current year. Once the cutoff year is calculated, any dates entered with a year value less than or equal to it are considered to be in the current century, while those greater than it are deemed to be in the previous century."

	self optionAt: 'shortYearCutoff' put: aStringOrNumber
]

{ #category : #actions }
JQDatepicker >> show [
	"Call up a previously attached date picker."
	
	self action: 'show'
]

{ #category : #'options-generated' }
JQDatepicker >> showAnim: aString [
	"Set the name of the animation used to show/hide the datepicker. Use 'show' (the default), 'slideDown', 'fadeIn', or any of the show/hide [http://docs.jquery.com/UI/Effects jQuery UI effects]."

	self optionAt: 'showAnim' put: aString
]

{ #category : #'options-generated' }
JQDatepicker >> showButtonPanel: aBoolean [
	"Whether to show the button panel."

	self optionAt: 'showButtonPanel' put: aBoolean
]

{ #category : #'options-generated' }
JQDatepicker >> showCurrentAtPos: aNumber [
	"Specify where in a multi-month display the current month shows, starting from 0 at the top/left."

	self optionAt: 'showCurrentAtPos' put: aNumber
]

{ #category : #'options-generated' }
JQDatepicker >> showMonthAfterYear: aBoolean [
	"Whether to show the month after the year in the header."

	self optionAt: 'showMonthAfterYear' put: aBoolean
]

{ #category : #'options-generated' }
JQDatepicker >> showOn: aString [
	"Have the datepicker appear automatically when the field receives focus ('focus'), appear only when a button is clicked ('button'), or appear when either event takes place ('both')."

	self optionAt: 'showOn' put: aString
]

{ #category : #'options-generated' }
JQDatepicker >> showOptions: anOptions [
	"If using one of the jQuery UI effects for showAnim, you can provide additional settings for that animation via this option."

	self optionAt: 'showOptions' put: anOptions
]

{ #category : #'options-generated' }
JQDatepicker >> showOtherMonths: aBoolean [
	"Display dates in other months (non-selectable) at the start or end of the current month."

	self optionAt: 'showOtherMonths' put: aBoolean
]

{ #category : #'options-generated' }
JQDatepicker >> showWeek: aBoolean [
	"When true a column is added to show the week of the year."

	self optionAt: 'showWeek' put: aBoolean

]

{ #category : #'options-generated' }
JQDatepicker >> stepMonths: aNumber [
	"Set how many months to move when clicking the Previous/Next links."

	self optionAt: 'stepMonths' put: aNumber
]

{ #category : #'options-generated' }
JQDatepicker >> weekHeader: aString [
	"The text to display for the week of the year column heading. This attribute is one of the regionalisation attributes."

	self optionAt: 'weekHeader' put: aString

]

{ #category : #'options-generated' }
JQDatepicker >> yearRange: aString [
	"Control the range of years displayed in the year drop-down: either relative to current year (-nn:+nn) or absolute (nnnn:nnnn)."

	self optionAt: 'yearRange' put: aString
]

{ #category : #'options-generated' }
JQDatepicker >> yearSuffix: aString [
	"Additional text to display after the year in the month headers. This attribute is one of the regionalisation attributes."

	self optionAt: 'yearSuffix' put: aString
]
