import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'

createRoot(document.getElementById('root') as HTMLElement).render(
	<StrictMode>
		<h1>Hello There!</h1>
	</StrictMode>,
)
