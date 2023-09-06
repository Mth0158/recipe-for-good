RSpec.describe Api::V1::RecipesController, type: :request do
  let(:headers) { { "ACCEPT" => "application/json" } }

  describe "GET index" do
    let!(:recipes) do
      create_list(:recipe, 3)
    end
    let!(:specific_recipe) do
      create(
        :recipe,
        ingredients: ["1 cup of specific ingredient"]
      )
    end
    let(:all_recipes) { recipes << specific_recipe }
    let(:get_request) do
      get api_v1_recipes_path(format: :json),
      params:,
      headers:
    end
    let(:params) { {} }

    before { get_request }

    it "returns a http :ok status" do
      expect(response)
        .to(have_http_status(:ok))
    end

    it "paginates the results with Pagy" do
      expect(assigns(:pagy))
        .to be_present
    end

    it "assigns @recipes with all recipes present in the database" do
      expect(assigns(:recipes))
        .to eq(all_recipes)
    end

    context "with the ingredients param" do
      let(:params) { { ingredients: ["specific"] } }

      it "only assigns @recipes with the recipes that have at leats one of these ingredients" do
        expect(assigns(:recipes).size)
          .to eq(1)
        expect(assigns(:recipes))
          .to include(specific_recipe)
      end
    end
  end

  describe "GET show" do
    let!(:recipe) { create(:recipe) }
    let(:get_request) do
      get api_v1_recipe_path(recipe, format: :json),
      params:,
      headers:
    end
    let(:params) { {} }

    before { get_request }

    it "returns a http :ok status" do
      expect(response)
        .to(have_http_status(:ok))
    end

    it "assigns @recipe" do
      expect(assigns(:recipe))
        .to eq(recipe)
    end
  end
end
