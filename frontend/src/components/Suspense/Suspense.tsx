import { LoadingOverlay } from '@mantine/core'
import { FC, Suspense as ReactSuspense } from 'react'

import { SuspenseProps } from './Suspense.types'

const Suspense: FC<SuspenseProps> = (props) => {
	const { children } = props

	return (
		<ReactSuspense fallback={<LoadingOverlay visible />}>
			{children}
		</ReactSuspense>
	)
}

export default Suspense
