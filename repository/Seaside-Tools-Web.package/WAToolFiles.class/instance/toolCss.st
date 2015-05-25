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
	background: url(config.png) no-repeat;
}
.window-titlebar .wa-deprecationtoolplugin {
	background: url(deprecated.png) no-repeat;
}
.window-titlebar .wa-memorytoolplugin {
	background: url(memory.png) no-repeat;
}
.window-titlebar .wa-profilertoolplugin {
	background: url(profiler.png) no-repeat;
}

'