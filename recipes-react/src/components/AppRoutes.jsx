import { Route, Routes } from "react-router-dom";
import IngredientsList from "../features/ingredients/IngredientsList";
import RecipesList from "../features/recipes/RecipesList";
import Recipe from "../features/recipes/Recipe";

function AppRoutes() {
  return (
    <Routes>
      <Route path="/" element={<IngredientsList featured="true" />} />
      <Route path="/ingredients" element={<IngredientsList />} />
      <Route path="/recipes" element={<RecipesList />} />
      <Route path="/recipes/:id" element={<Recipe />} />
    </Routes>
  );
}

export default AppRoutes;
