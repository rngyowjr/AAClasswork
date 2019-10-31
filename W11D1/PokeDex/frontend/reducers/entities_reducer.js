import { combineReducers } from 'redux';
import pokemonReducer from './pokemon_reducer';

const entitiesReducer = combineReducers({
  pokemon: pokemonReducer,
  //itemsReducer
})

export default entitiesReducer;