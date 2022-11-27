import express from 'express'
import swagger from 'swagger-ui-express'

import { router } from './controller/router'
import { openApiInstance } from './docs/openApi'

const app = express()
const swaggerServe = swagger.serve
const swaggerSetup = swagger.setup(openApiInstance.generateJson())
const port = 3000

app.use('/api', router)
app.use('/docs', swaggerServe, swaggerSetup)

app.listen(port, () => console.log(`Server running on port: ${port}`))
