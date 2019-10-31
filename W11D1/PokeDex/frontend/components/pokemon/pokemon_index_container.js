import { connect } from 'react-redux';
import { requestAllPokemon } from '../../middleware/thunk';
import { selectAllPokemon } from '../../reducers/selectors';
import PokemonIndex from './pokemon_index';

// Both functions are invoked when our redux store updates.
// They are responsible for determining and constructing the props 
// that are passed to presentational component.

// selector to get a slice of state and pass it to component
const mapStateToProps = state => ({
  // piece of state that container subscribes to
  pokemon: selectAllPokemon(state)
});

// dispatch(requestAllPokemon() is dispatch action creator from thunk
const mapDispatchToProps = dispatch => ({
  requestAllPokemon: dispatch(requestAllPokemon()) // dispatch requestAllPokemon action.
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex);