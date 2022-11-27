import { Router } from 'express'

export const cardsController = Router()

cardsController.get('/', (_req, res) => {
	res.send('Hello from Cards Controller')
})
