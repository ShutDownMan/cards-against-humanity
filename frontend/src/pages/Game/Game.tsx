import { Carousel } from '@mantine/carousel'
import { Container, Stack } from '@mantine/core'
import { FC } from 'react'

import { GameCard } from '../../components'

import './../../../../backend/jacah_backend/assets/js/game_socket.js'

interface GameCardOption {
	id: string
	type: 'black' | 'white'
	text: string
}

const question: GameCardOption = {
	id: '1',
	type: 'black',
	text: 'Eu bebo para esquecer',
}

const answers: GameCardOption[] = [
	{
		id: '2',
		type: 'white',
		text: 'Silencio',
	},
	{
		id: '3',
		type: 'white',
		text: 'Uma freira',
	},
	{
		id: '4',
		type: 'white',
		text: 'Policia',
	},
]

const Game: FC = () => {
	return (
		<Container>
			<Stack
				align='center'
				spacing='xs'
				mx='auto'
				sx={{ height: '100%' }}
				justify='space-around'
			>
				<GameCard text={question.text} type={question.type} />

				<Carousel
					// sx={{ minWidth: '400px' }}
					withControls={false}
					slideSize='75%'
					loop
					slideGap='xs'
				>
					{answers.map((answer) => (
						<Carousel.Slide key={answer.id}>
							<GameCard text={answer.text} type={answer.type} />
						</Carousel.Slide>
					))}
				</Carousel>
			</Stack>
		</Container>
	)
}

export default Game
