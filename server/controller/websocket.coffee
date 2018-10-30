mongoose = require 'mongoose'

Todo = require '../model/todo'

getTodos = (req,res) ->
  Todo.find().exec (err,todos) -> 
    console.log 'Todos', todos
    if err
        return res.json {'success':false,'message':'Some Error'}
    res.json {'success':true,'message':'Todos fetched successfully','todos':todos } 

    
getTodo = (req,res) -> 
   Todo.find({_id:req.params.id}).exec (err,todo) ->
    console.log 'Todo', todo
    if err
       res.json {'success':false,'message':'Some Error'}    
    if todo.length
       res.json {'success':true,'message':'Todo fetched by id successfully','todo':todo}    
    else
       res.json {'success':false,'message':'Todo with the given id not found'}

module.exports.getTodos = getTodos
module.exports.getTodo = getTodo