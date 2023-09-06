RSpec.describe Extractors::FakerIngredients, type: :lib do
  describe "::extract" do
    let(:extractor_call) { described_class.extract(faker_ingredients) }

    let(:faker_ingredients) do
      [
        {
          "name" => "Fennel Seeds"
        }
      ]
    end

    it "creates an ingredient from the dataset" do
      expect { extractor_call }
        .to change(Ingredient, :count).by(1)
    end
  end
end
