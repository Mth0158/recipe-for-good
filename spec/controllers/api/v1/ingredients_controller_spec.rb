RSpec.describe Api::V1::IngredientsController, type: :request do
  let(:headers) { { "ACCEPT" => "application/json" } }

  describe "GET index" do
    let!(:base_ingredients) do
      create_list(:ingredient, 3)
    end
    let!(:featured_ingredient) do
      create(:ingredient, :featured)
    end
    let!(:searched_ingredient) do
      create(:ingredient, name: searched_ingredient_name)
    end
    let(:searched_ingredient_name) { "zxyt" }
    let(:ingredients) { base_ingredients << featured_ingredient << searched_ingredient }

    let(:get_request) do
      get api_v1_ingredients_path(format: :json),
      params:,
      headers:
    end
    let(:params) { {} }

    before { get_request }

    it "returns a http :ok status" do
      expect(response)
        .to(have_http_status(:ok))
    end

    it "assigns @ingredients with all ingredients in database" do
      expect(assigns(:ingredients))
        .to eq(ingredients)
    end

    it "paginates the results with Pagy" do
      expect(assigns(:pagy))
        .to be_present
    end

    context "with the featured param" do
      let(:params) { { featured: true } }

      it "only assigns @ingredients with featured ingredients" do
        expect(assigns(:ingredients).size)
          .to eq(1)
        expect(assigns(:ingredients))
          .to include(featured_ingredient)
      end
    end

    context "with the query param" do
      let(:params) { { query: searched_ingredient_name } }

      it "only assigns @ingredients with ingredients which name contains the searched ingredient name" do
        expect(assigns(:ingredients).size)
          .to eq(1)
        expect(assigns(:ingredients))
          .to include(searched_ingredient)
      end
    end
  end
end
