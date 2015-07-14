accessing
objectLogSummary

	| sums summary |
	sums := Dictionary new.
	1 to: self labels size do: [:i | sums at: i put: 0 ].
	self objectLogEntries do: [:ea | | tally |
		tally := sums at: ea priority.
		sums at: ea priority put: (tally + 1)].
	summary := Array new: self labels size.
	1 to: self labels size do: [:i| summary at: i put: (sums associationAt: i) ].
	^summary