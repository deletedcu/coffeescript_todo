require('dotenv').config()
express = require 'express'
  , router = require './routes/main'
  , bodyParser = require 'body-parser'
  , user = require './routes/user'
  , http = require 'http'
  , path = require 'path'
  , mongoose = require 'mongoose'
  , socket = require 'socket.io'
  , mongoURI =  'mongodb://localhost/mern-todo-app' || process.env.MONGOLAB_URI 
  , Todo = require './model/todo'

controller = require './controller/controller'

connectRepeat = ->
  console.log 'Mongo URI:', mongoURI
  mongoose.connect mongoURI, (err) -> 
    if err 
      console.error 'Failed to connect to mongo on startup - retrying in 5 sec', err 
      setTimeout connectRepeat, process.env.DB_CONNECT_RETRY
    
connectRepeat() 

mongoose.connection.on 'open', -> 
  console.log 'Connected to Mongodb'

app = express()
app.set 'port', process.env.PORT || 8080
app.use bodyParser.json()
app.use bodyParser.urlencoded { extended:true }
app.use express.static path.join(__dirname, 'public')  
app.use (req,res,next) ->
  res.header "Access-Control-Allow-Origin", "*"
  res.header "Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept"
  next()
app.use '/api', router
app.get '/', (req,res) ->
  res.end 'Api working' 
app.use (req, res, next) ->
  res.status(404).send '<h2 align=center>Hello</h2>'

server = http.Server(app);
io = socket(server) 
# socket.io connection
io.on 'connection', (socket) ->
  console.log "Connected to Socket!!" + socket.id 
  # Receiving Todos from client
  socket.on 'addTodo', (Todo) ->
    console.log 'addTodo ', Todo
    controller.addTodo io,Todo

  # Receiving Updated Todo from client
  socket.on 'updateTodo', (Todo) ->
    console.log 'socketData update', Todo
    controller.updateTodo io,Todo

  # Receiving Todo to Delete
  socket.on 'deleteTodo', (Todo) ->
    console.log 'socketData delete'
    controller.deleteTodo io,Todo


run_port = app.get('port')
server.listen run_port, () ->
  console.log 'App Server Listening at: ', run_port

  




