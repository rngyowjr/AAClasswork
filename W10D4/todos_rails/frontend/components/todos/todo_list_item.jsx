import React from 'react';

class TodoListItem extends React.Component {
    constructor(props){
        super(props);
    }

    render(){
        return(
            <div>
                {this.props.todo.id}
                <br/>
                {this.props.todo.title}
            </div>
        )
    }
}



export default TodoListItem;

