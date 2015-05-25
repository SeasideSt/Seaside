hooks
style
	^ 'a {
	color: #00f;
	cursor: pointer;
	text-decoration: underline;	
}
#status {
	background-color: #eee;
}
#messages {
	height: 10em;
	overflow: auto;
}
#messages .message {
	margin-top: 0.25em;
	margin-bottom: 0.25em;
}
#messages .message .user {
	font-weight: bold;
	margin-right: 1em;
}
#messages .message .event {
	font-style: italic;
}
#input {
	width: 100%;
	background-color: #eee;
}'