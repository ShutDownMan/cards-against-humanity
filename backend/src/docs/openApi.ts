import { OpenApi } from 'ts-openapi'

import { initCardsDocs } from './cards/cardsDocs'

export const openApiInstance = new OpenApi(
	/** Version */
	'v1.0',

	/** Name */
	'Cards Against Humanity Api',

	/** Description */
	'A Api for serving inputs for the game Cards Against Humanity',

	/** Api Maintainer */
	'gabrielpereira050201@hotmail.com',
)

openApiInstance.setServers([{ url: 'http://localhost:3000' }])

/** Initialize Docs */
initCardsDocs({ path: '/api/cards', tags: ['Cards'] })
