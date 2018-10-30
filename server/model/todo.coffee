
# This is the to-do model
mongoose = require 'mongoose'
init = () ->
    TheSchema = new mongoose.Schema
        todoText: String,
        todoDesc: String,
    
    mongoose.model 'Todo', TheSchema

Todo = Todo || init()

module.exports = Todo
