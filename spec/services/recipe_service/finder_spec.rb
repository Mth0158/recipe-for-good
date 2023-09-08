RSpec.describe RecipeService::Finder do
  describe "#call" do
    let(:service_call) { described_class.call(relation, params) }
    let(:relation) { Recipe.all }
    let!(:salt_recipe) { create(:recipe, ingredients: %w[salt]) }
    let!(:salt_pepper_recipe) { create(:recipe, ingredients: %w[salt pepper]) }
    let!(:salt_pepper_zucchini_recipe) { create(:recipe, ingredients: %w[salt pepper zucchini]) }

    context "when called without any ingredient param" do
      let(:params) { {} }

      it "returns the passed relation" do
        expect(service_call)
          .to eq(relation)
      end
    end

    context "when called with ingredients params" do
      let(:params) { { ingredients: } }
      let(:ingredients) do
        %w[pepper]
      end

      it "returns an array" do
        expect(service_call)
          .to be_an_instance_of Array
      end

      context "when called with 1 ingredient" do
        it "only returns the recipes that have the ingredients" do
          expect(service_call)
            .to contain_exactly(
              salt_pepper_zucchini_recipe,
              salt_pepper_recipe
            )
        end
      end

      context "when called with several ingredients" do
        let(:ingredients) do
          %w[salt pepper zucchini]
        end

        it "returns the recipes that have at least one of the ingredients" do
          expect(service_call)
            .to contain_exactly(
              salt_pepper_zucchini_recipe,
              salt_pepper_recipe,
              salt_recipe
            )
        end

        it "returns the recipes ordered by the most matching ingredient count" do
          expect(service_call)
            .to eq(
              [
                salt_pepper_zucchini_recipe,
                salt_pepper_recipe,
                salt_recipe
              ]
            )
        end
      end

      context "with searched ingredient inside a detailed recipe ingredient" do
        let(:ingredients) do
          %w[Parmesan]
        end
        let!(:parmesan_recipe) { create(:recipe, ingredients: ["½ cup grated Parmesan cheese"]) }

        it "finds the recipe" do
          expect(service_call)
            .to contain_exactly(
              parmesan_recipe
            )
        end
      end

      context "with different case types" do
        let(:ingredients) do
          %w[parmesan]
        end
        let!(:parmesan_recipe) { create(:recipe, ingredients: ["½ cup grated Parmesan cheese"]) }

        it "finds the recipe" do
          expect(service_call)
            .to contain_exactly(
              parmesan_recipe
            )
        end
      end
    end
  end
end
