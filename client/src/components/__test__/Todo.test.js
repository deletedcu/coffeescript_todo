import React from 'react';
import Todo, * as toDoActions from '../Todo';
import { shallow } from 'enzyme';
describe('Todo', () => {
    let component = null;
    const id = 0;
    const fake_props = { 
        todo: {            
            todoText:'Study', 
            todoDesc:'English'
        }, 
        isFetching: true 
    };

    it('renders correctly', () => {
    component = shallow(<Todo 
        mappedfetchTodoById = {jest.fn()} 
        params = {id} 
        mappedTodoState = {fake_props}/>);
    });

    it('matches snapshot', () => {
        expect(component).toMatchSnapshot();
    })

});


