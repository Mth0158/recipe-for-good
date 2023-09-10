import { useState } from 'react';

function Ingredients(props) {
  const [isActive, setIsActive] = useState(false);
  const ingredient = props.ingredient

  const changeStyle = () => {
    setIsActive(current => !current);
  };

  return (
    <>
      <div key={ingredient.id} className="col-4">
        <input type="checkbox" id={ingredient.name} name="ingredients[]" value={ingredient.name} className="d-none" />
        <label 
          htmlFor={ingredient.name}
          onClick={changeStyle}
          style={{
            backgroundColor: isActive ? 'rgb(230, 230, 230)' : '',
            cursor: 'pointer'
          }}
          className="rounded border text-center align-middle">
          <p className="p-3">{ingredient.name}</p>
        </label>
      </div>
    </>
  )
}

export default Ingredients
