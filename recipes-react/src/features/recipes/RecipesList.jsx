import { useState, useEffect } from 'react';
import { Link } from "react-router-dom"
import { API_URL } from '../../constants';

function buildRecipesUrl(ingredients) {
  const baseUrl = `${API_URL}/recipes`

  if (ingredients) {
    const ingredientsParameter = ingredients.map((ingredient) => `ingredients[]=${ingredient}`).join("&")
    return `${baseUrl}?${ingredientsParameter}`
  }
  return baseUrl
}

function RecipesList() {
  const [recipes, setRecipes] = useState([])
  const [paging, setPaging] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  const ingredientsParameters = new URLSearchParams(window.location.search)
  const ingredients = ingredientsParameters.getAll("ingredients[]").filter((ingredient) => ingredient)

  const recipesUrl = buildRecipesUrl(ingredients)

  useEffect(() => {
    fetch(recipesUrl)
      .then((response) => {
        if (!response.ok) {
          throw response;
        }
        return response.json();
      })
      .then((response) => {
        setRecipes(response.data)
        setPaging(response.paging)
      })
      .catch((error) => {
        setError("An error ocurred while fetching the recipes")
        console.error("An error ocurred while fetching the recipes", error)
      })
      .finally(() => {
        setLoading(false)
      })
  }, [])

  if (loading) {
    return <p>Loading...</p>
  }

  if (error) {
    return <p>Error: {error.message}</p>
  }

  return (
    <>
      <Link to="/">Back to search</Link>
      <h2>We found {paging.count} recipes matching the ingredients you have!</h2>

      <div className="mt-3">
        {ingredients.map((ingredient) => (
          <div key={ingredient.id} className="badge text-bg-primary me-1">
            <span>{ingredient}</span>
          </div>
        ))}
      </div>

      <div className="mt-4">
        <div className="row g-4">
          {recipes.map((recipe) => (
            <Link to={`/recipes/${recipe.id}`} key={recipe.id}>
              <div className="col-12">
                <div className="card mb-3">
                  <div className="row g-0">
                    <div className="col-md-4">
                      <img src={recipe.image_url} className="img-fluid rounded-start" alt={recipe.title} />
                    </div>
                    <div className="col-md-8">
                      <div className="card-body">
                        <h5 className="card-title">{recipe.title}</h5>
                        <hr />
                        <p className="card-text">{recipe.rating} / 5 ⭐️</p>
                        <p className="card-text mt-2">{recipe.prep_time} minutes 👨‍🍳 + {recipe.cook_time} minutes 🥘</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </>
  )
}

export default RecipesList
