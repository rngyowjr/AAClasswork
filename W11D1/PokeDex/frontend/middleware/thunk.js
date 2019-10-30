import { receiveAllPokemon } from '../actions/pokemon_actions'
import * as APIUtil from '../util/api_util'

export const thunk = ({ dispatch, getState}) => next => action => {
  if (typeof action === 'function') {
    return action(dispatch, getState);
  }
  return next(action)
}

export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
)
