import preprocess from 'svelte-preprocess';
import md from 'mdsvex';
import mdsvexConfig from './mdsvex.config.js';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	extensions: [ '.svelte', ...mdsvexConfig.extensions ],
	// Consult https://github.com/sveltejs/svelte-preprocess
	// for more information about preprocessors
	// preprocess: preprocess(),
	preprocess: [md.mdsvex(mdsvexConfig)],

	kit: {
		// hydrate the <div id="svelte"> element in src/app.html
		target: '#svelte'
	}
};

export default config;
