import { useState, useEffect } from 'react';
import Select from 'react-select';
import PropTypes from 'prop-types';
import Ingredient from "./Ingredient";
import { API_URL } from '../../constants';

function IngredientsList() {
  const [ingredients, setIngredients] = useState([])
  const [featuredIngredients, setFeaturedIngredients] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  const fetchIngredients = () => {
    fetch(`${API_URL}/ingredients`)
      .then((response) => {
        if (!response.ok) {
          throw response;
        }
        return response.json();
      })
      .then((response) => {
        setIngredients(response.data.filter((ingredient) => !ingredient.is_featured))
        setFeaturedIngredients(response.data.filter((ingredient) => ingredient.is_featured))
      })
      .catch((error) => {
        setError("An error ocurred while fetching the ingredients")
        console.error("An error ocurred while fetching the ingredients", error)
      })
      .finally(() => {
        setLoading(false)
      })
  }

  useEffect(() => {
    fetchIngredients()
  }, [])

  const options = ingredients.map((ingredient) => ({value: ingredient.name, label: ingredient.name}))

  if (loading) {
    return <p>Loading...</p>
  }

  if (error) {
    return <p>Error: {error.message}</p>
  }

  return (
    <>
      <h2>Hello, pick the ingredients you have at home 🥑...</h2>

      <form className="mt-5" action="/recipes" method="get">
        <Select
          options={options}
          isMulti
          name="ingredients[]"
          placeholder="Search other ingredients"
          className="mb-2"
        />

        <div className="row g-2">
          {featuredIngredients.map((featuredIngredient) => (
            <Ingredient key={featuredIngredient.id} ingredient={featuredIngredient}/>
          ))}
        </div>

        <div className="w-100 d-flex justify-content-center mt-4">
          <button className="btn btn-primary btn-lg" type="submit">Search the best recipes! 🚀</button>
        </div>
      </form>
    </>
  )
}

IngredientsList.propTypes = {
  featured: PropTypes.string
}

export default IngredientsList
