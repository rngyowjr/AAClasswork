import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';
class TodoList extends React.Component{
    constructor(props){
        super(props);
    }

    render(){

        return (
            <div>
                <h3>Todo List:</h3>
                <ul>
                    {this.props.todos.map((todo, i) => {
                        return (
                           
                            <ul key={i}> 
                                    <li><TodoListItem  todo={todo} /></li>
                                    <br/>
                            </ul>
                            
                           
                        );
                    })}
                    <TodoForm receiveTodo={this.props.receiveTodo}/>
                </ul>
            </div>
        );
    }
}

export default TodoList;