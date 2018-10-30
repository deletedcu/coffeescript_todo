import { connect } from 'react-redux';
import * as todoActions from '../actions/todoActions';
import Todo from '../components/Todo';

// map state from store to props
const mapStateToProps = (state) => {
  return {
    mappedTodoState: state.todoState
  }
}

// map actions to props
const mapDispatchToProps = (dispatch) => {
  return {
    mappedfetchTodoById: todoId => dispatch(todoActions.fetchTodoById(todoId))
  }
}

export default connect(mapStateToProps,mapDispatchToProps)(Todo);
