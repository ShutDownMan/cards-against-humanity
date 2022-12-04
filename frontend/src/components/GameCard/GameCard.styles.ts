import { createStyles } from '@mantine/core'
import { GameCardProps } from './GameCard.types'

export const useStyles = createStyles((theme, { type }: GameCardProps) => ({
	card: {
		backgroundColor:
			type === 'black' ? theme.colors.dark[9] : theme.colors.gray[0],

		color: type === 'black' ? theme.colors.gray[0] : theme.colors.dark[9],

		minHeight: '200px',
		width: '100%',
		// maxWidth: '400px',

		[`@media (min-width: ${theme.breakpoints.sm}px)`]: {
			maxWidth: '400px',
		},
	},
}))
