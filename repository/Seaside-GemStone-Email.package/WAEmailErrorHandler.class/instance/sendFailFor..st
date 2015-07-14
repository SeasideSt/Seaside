private
sendFailFor: anError
	| message |
	message := WAEmailMessage
		from: self from
		to: self to
		subject: (self subjectFor: anError).
	message body: (self bodyFor: anError).
	message send