import { useParams } from "react-router-dom"
import { useState, useEffect } from 'react';
import { Link } from "react-router-dom"
import { API_URL } from '../../constants';

function Recipe() {
  const [recipe, setRecipe] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  const { id } = useParams();

  const recipesUrl = `${API_URL}/recipes/${id}`

  useEffect(() => {
    fetch(recipesUrl)
      .then((response) => {
        if (!response.ok) {
          throw response;
        }
        return response.json();
      })
      .then((response) => {
        setRecipe(response.data.recipe)
      })
      .catch((error) => {
        setError("An error ocurred while fetching the recipe")
        console.error("An error ocurred while fetching the recipe", error)
      })
      .finally(() => {
        setLoading(false)
      })
  }, [id])

  if (loading) {
    return <p>Loading...</p>
  }

  if (error) {
    return <p>Error: {error.message}</p>
  }

  return (
    <>
      <Link to="/">Back to search</Link>  
      <hr />
      <img src={recipe.image_url} alt={recipe.title} className="img-fluid" style={{maxHeight: '300px'}} />
      <h2>{recipe.title}</h2>
      <p>{recipe.rating} / 5 ⭐️</p>
      <hr />
      <p>{recipe.prep_time} minutes 👨‍🍳 + {recipe.cook_time} minutes 🥘</p>
      <hr />
      <p>Ingredients:</p>
      <ul>
        {recipe.ingredients.map((ingredient, index) => (
          <li key={index}>{ingredient}</li>
        ))}
      </ul>
    </>
  )
}

export default Recipe
