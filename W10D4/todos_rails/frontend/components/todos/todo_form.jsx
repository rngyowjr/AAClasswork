import React from 'react';
import uniqueId from '../../utils/todo_id_gen'

class TodoForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            title: "",
            body: ""
        };
        this.updateTitle = this.updateTitle.bind(this);
        this.updateBody = this.updateBody.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
        
    }

    updateTitle(e) {
        this.setState({ title: e.target.value})
    }

    updateBody(e) {
        this.setState({ body: e.target.value})
    }

    handleSubmit(e) {
        e.preventDefault();
        this.state.id = uniqueId();
        this.props.receiveTodo(this.state);
        this.setState({ title: "", body: ""})
    }

    render() {
        return (
            <div>
                <form onSubmit={this.handleSubmit}>
                    <input type="text" onChange={this.updateTitle} value={this.state.title}/>
                    <br/>
                    <textarea onChange={this.updateBody} height="600px" width="200px" value={this.state.body}></textarea>
                    <br/>
                    <input type="submit" value="Add Todo"/>
                </form>  
            </div>
        )
    }
}

export default TodoForm;