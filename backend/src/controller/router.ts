import { Router } from 'express'

import { cardsController } from './cards/cardsController'

export const router = Router()

router.use('/cards', cardsController)
