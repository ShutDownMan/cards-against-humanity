import { textPlain } from 'ts-openapi'

import { openApiInstance } from '../openApi'

import { InitDocs } from '../../types/docTypes'

export const initCardsDocs = ({ path, tags }: InitDocs) => {
	openApiInstance.addPath(
		path,
		{
			post: {
				description: 'Create new card',
				operationId: 'create-card-id',
				responses: {
					200: textPlain('create tes'),
				},
				summary: 'Test cre',
				tags: tags,
			},
		},
		true,
	)

	openApiInstance.addPath(
		path,
		{
			get: {
				description: 'Test',
				operationId: 'test-id',
				responses: {
					200: textPlain('Test'),
				},
				summary: 'Get',
				tags: tags,
			},
		},
		true,
	)
}
