import { Card, Text } from '@mantine/core'
import { FC } from 'react'

import { useStyles } from './GameCard.styles'
import { GameCardProps } from './GameCard.types'

const GameCard: FC<GameCardProps> = (props) => {
	const { text } = props

	const { classes } = useStyles(props)

	return (
		<Card
			className={classes.card}
			m='md'
			p='lg'
			radius='md'
			shadow='sm'
			withBorder
		>
			<Text>{text}</Text>
		</Card>
	)
}

export default GameCard
