accessing-styles
toolCss
	^ '.tool table {
	margin-left: 5px;
	border-collapse: collapse;
}
.tool table td {
	padding-left: 5px;
	padding-right: 5px;
}
.tool table td,
.tool table th,
.tool table .left {
	text-align: left;
}
.tool table .right {
	text-align: right;
}

.window-titlebar .wa-configuretoolplugin, .window-titlebar .wa-configuredispatcherplugin {
	background: url(config.svg) no-repeat;
	background-size: 16px 16px;
}
.window-titlebar .wa-deprecationtoolplugin {
	background: url(deprecated.svg) no-repeat;
	background-size: 16px 16px;
}
.window-titlebar .wa-memorytoolplugin {
	background: url(memory.svg) no-repeat;
	background-size: 16px 16px;
}
.window-titlebar .wa-profilertoolplugin {
	background: url(profiler.svg) no-repeat;
	background-size: 16px 16px;
}

'