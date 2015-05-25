private
privateIsValidSecond: theSecond hourNumber: theHour minuteNumber: theMinute

	^ (theHour between: 0 and: 23)
		and: [ (theMinute between: 0 and: 59)
		and: [ theSecond between: 0 and: 59 ] ]