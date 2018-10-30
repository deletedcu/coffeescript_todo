
express = require 'express'
websocket = require '../controller/websocket'

router = express.Router()

router.route('/')
     .get(websocket.getTodos)

router.route('/:id')
      .get(websocket.getTodo)

module.exports = router