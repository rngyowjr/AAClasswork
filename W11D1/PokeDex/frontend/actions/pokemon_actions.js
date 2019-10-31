export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON"
export const RECEIVE_ONE_POKEMON = "RECEIVE_ONE_POKEMON"

export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
})

export const receiveOnePokemon = (poke) => ({
  type: RECEIVE_ONE_POKEMON,
  poke
})