import React from 'react';
import { FormGroup, ControlLabel, FormControl,Button } from 'react-bootstrap';

const TodoForm = (props) => {
  return (
    <form className="form form-horizontal" id="addTodoForm" onSubmit={props.addTodo}>
      <div className="row">
        <h3 className="centerAlign">Add Your Todo</h3>
        <div className="col-md-8">
          <FormGroup>
            <ControlLabel>Title: </ControlLabel>
            <FormControl
              type="text" placeholder="Enter todo"
              name="todoText"
            />
          </FormGroup>
        </div>
        <div className="col-md-12">
          <FormGroup>
            <ControlLabel>Description: </ControlLabel>
            <FormControl
              componentClass="textarea" placeholder="Enter description"
              name="todoDesc"
            />
          </FormGroup>
        </div>
      </div>
      <div className="col-md-6 col-md-offset-3">
        <FormGroup>
          <Button type="submit" bsStyle="success" bsSize="large" block> Add </Button>
        </FormGroup>
      </div>
    </form>
  );
}

export default TodoForm;
