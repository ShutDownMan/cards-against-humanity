import { lazy } from 'react'
import { createBrowserRouter, Navigate } from 'react-router-dom'

import { Suspense } from '../components'

const Game = lazy(() => import('./Game/Game'))

export const router = createBrowserRouter([
	{
		path: '/',
		element: <Navigate to='/game' />,
	},
	{
		path: '/game',
		element: (
			<Suspense>
				<Game />
			</Suspense>
		),
	},
])
