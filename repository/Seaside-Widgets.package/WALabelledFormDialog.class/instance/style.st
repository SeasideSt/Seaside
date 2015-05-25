hooks
style
	^ '
.dialog-row {
	clear: both;
	/*set position: relative to handle the ie disappearing text bug*/
	position: relative;
	margin-top: 3px;
}

.dialog-form-label {
	width: 100px;
	float: left;
	text-align: right;
	padding: 2px 6px;
	margin-right: 4px;
	margin-top: 2px;
}

.dialog-form-field {
	text-align: left;
	padding: 2px;
	margin-top: 2px;
	float: left;
}

.dialog-buttons {
	clear: both;
	padding: 10px;
	text-align: center
}

.dialog-spacer {
	clear: both;
	height: 10px;
}
	'