import { MantineProvider } from '@mantine/core'
import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { RouterProvider } from 'react-router-dom'

import { router } from './pages/Router'

createRoot(document.getElementById('root') as HTMLElement).render(
	<StrictMode>
		<MantineProvider withGlobalStyles withNormalizeCSS>
			<RouterProvider router={router} />
		</MantineProvider>
	</StrictMode>,
)
