import React from 'react';
import { NavLink } from 'react-router-dom'

export const PokemonIndexItem = (props) => {
  return (
    <div>
      <NavLink to="/pokemon/:pokemonId">
        <li>
          {props.pokemon.name}
          <img src={props.pokemon.image_url} alt={props.pokemon.name} />
        </li>
      </NavLink>
    </div>
  )
}

