# GET home page
exports.index = (req, res) ->
  res.render 'index', { title: 'Todo-list-socket server CoffeeScript + MongoDB' }