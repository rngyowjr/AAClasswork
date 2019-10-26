export const allTodos = (state) => {
    // let newArr = [];
    return Object.keys(state.todos).map( key => {
        return state.todos[key];
    })
};