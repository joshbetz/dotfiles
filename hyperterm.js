module.exports = {
	config: {
		// default font size in pixels for all tabs
		fontSize: 18,

		windowSize: [800, 500],

		// font family with optional fallbacks
		fontFamily: 'Inconsolata, Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',

		cursorShape: 'BEAM',

		// some color overrides. see http://bit.ly/29k1iU2 for
		// the full list
		colors: [
			'#000000',
			'#ff0000',
			'#33ff00',
			'#ffff00',
			'#0066ff',
			'#cc00ff',
			'#00ffff',
			'#d0d0d0',
			'#808080',
			'#ff0000',
			'#33ff00',
			'#ffff00',
			'#0066ff',
			'#cc00ff',
			'#00ffff',
			'#ffffff'
		],

		hyperlinks: {
			clickAction: 'ignore',
			defaultBrowser: true
		}
	},

	// a list of plugins to fetch and install from npm
	// format: [@org/]project[#version]
	// examples:
	//   `hypersolar`
	//   `@company/project`
	//   `project#1.0.1`
	plugins: [
		'hyper-tomorrow-night',
		'hyperlinks',
		'hyperterm-1password',
		'hyper-tabs-enhanced',
	],

	// in development, you can create a directory under
	// `~/.hyperterm_plugins/local/` and include it here
	// to load it and avoid it being `npm install`ed
	localPlugins: []
};
