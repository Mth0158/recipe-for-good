import './App.css';
import IngredientsList from "./features/ingredients/IngredientsList";

function App() {
  return (
    <>
      <h1>Hello, pick the ingredients you have at home 🥑...</h1>
      <IngredientsList featured="true" />
    </>
  )
}

export default App
