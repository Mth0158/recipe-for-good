import { useState, useEffect } from 'react';
import PropTypes from 'prop-types';
import { API_URL } from '../../constants';

function IngredientsList(props) {
  const featured = props.featured === 'true'
  const [ingredients, setIngredients] = useState([])
  const [, setLoading] = useState(true)
  const [, setError] = useState(null)

  const ingredientsUrl = `${API_URL}/ingredients${ featured ? "?featured=true" : "" }`

  useEffect(() => {
    fetch(ingredientsUrl)
      .then((response) => {
        if (!response.ok) {
          throw response;
        }
        return response.json();
      })
      .then((response) => {
        setIngredients(response.data)
      })
      .catch((error) => {
        setError("An error ocurred while fetching the ingredients")
        console.error("An error ocurred while fetching the ingredients", error)
      })
      .finally(() => {
        setLoading(false)
      })
  }, [])

  return (
    <>
      <div>
        {ingredients.map((ingredient) => (
          <h2 key={ingredient.id}>{ingredient.name}</h2>
        ))}
      </div>
    </>
  )
}

IngredientsList.propTypes = {
  featured: PropTypes.bool
}

export default IngredientsList
