import { textPlain } from 'ts-openapi'
import { PathInput } from 'ts-openapi/lib/openapi/openapi.types'

import { openApiInstance } from '../openApi'

export const initCardsDocs = () => {
	const pathInput: PathInput = {
		get: {
			description: 'Test',
			operationId: 'test-id',
			responses: {
				200: textPlain('Test'),
			},
			summary: 'Get',
			tags: ['Api'],
		},
	}

	openApiInstance.addPath('/api/cards', pathInput, true)
}
