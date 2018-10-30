# Coffeescript-React-Socket Todo App

## Overview
This project is about creating a lightweight todo app with a minimal user interface. The app has the following abilities:
- List todos
- Add todo
- Update todo
- Delete todo

## Technology
The app includes the technologies listed below:
- Node
- CoffeeScript 
- MVC pattern for express server written by coffeescript
- Socket.io
- MongoDB & Mongoose
- Redux pattern for react front-end
- Jest & Enzyme
- Others: yarn, npm, Git

## Install & Run
- Make sure you are running ```mongodb``` on your local machine. Or you can use ```mLab```, then fill the ```URI``` at the env file.
- Create ```.env``` file in the server root folder, and fill the value, referring the file named as ```env_example``` 
- Install npm using ```npm install``` or ``` yarn install ``` for both folders : "server" and "client".
- First run ```npm run start``` at the server folder, and then do the same command at the client folder.
- It will show the simple todo app on the ```3000``` port.

## Unit Test
 - In the client folder, run the command ```npm run test```, It will show 2 unit's test result.
 - App.test.js ( Default offered by create-react-app cli)
 - Applied response check using Enzyme's shallow about the one of components, Todo 

## License
[MIT License](http://opensource.org/licenses/MIT)