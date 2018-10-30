mongoose = require 'mongoose'

Todo = require '../model/todo'

addTodo = (io,T) ->  
  newTodo = new Todo T
  newTodo.save (err,todo) -> 
    if err 
      result = {'success':false,'message':'Some Error','error':err }
      console.log result    
    else
       result = {'success':true,'message':'Todo Added Successfully','todo':todo }
       io.emit 'TodoAdded', result

updateTodo = (io,T) ->  
   Todo.findOneAndUpdate { _id:T.id }, T, { new:true }, (err,todo) ->
    if err
       result = {'success':false,'message':'Some Error','error':err}
       console.log result    
    else
       result = {'success':true,'message':'Todo Updated Successfully','todo':todo}
       io.emit 'TodoUpdated', result

deleteTodo = (io,T) => 
   Todo.findByIdAndRemove T._id, (err,todo) ->
    if err 
       result = {'success':false,'message':'Some Error','error':err}
       console.log result    
    else 
      result = {'success':true,'message':'Todo deleted successfully', 'todo':todo}
      io.emit 'TodoDeleted', result
 
module.exports.addTodo = addTodo    
module.exports.updateTodo = updateTodo  
module.exports.deleteTodo = deleteTodo 


