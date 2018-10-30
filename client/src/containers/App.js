
import { connect } from 'react-redux';
import * as appActions from '../actions/appActions';
import App from '../components/App';
import * as todoActions from '../actions/todoActions';

// map state from store to props
const mapStateToProps = (state) => {
  return {   
    mappedAppState: state.appState
  }
}

// map actions to props
const mapDispatchToProps = (dispatch) => {
  return {
    mappedToggleAddTodo: () => dispatch(appActions.toggleAddTodo()),
    mappedAddTodo: (todo,socket) => dispatch(todoActions.addNewTodo(todo,socket)),
    showTodoAddedBySocket: data => dispatch(todoActions.addNewTodoRequestSuccess(data.todo, data.message))
  }
}

export default connect(mapStateToProps,mapDispatchToProps)(App);
