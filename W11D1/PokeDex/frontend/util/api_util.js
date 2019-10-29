export const fetchAllPokemon = () => (
  $.ajax({
    method: "GET",
    url: "/api/pokemon"
  })


)


// const pokemon = {
//   1: {
//     id: 1,
//       name: "Picachu",
//     image_url: "pichachu.jpg"
//       },
//   2: {
//     id: 2,
//       name: "weedle",
//     image_url: "weedle.jpg"
//       }
// }