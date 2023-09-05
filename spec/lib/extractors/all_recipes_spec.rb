RSpec.describe Extractors::AllRecipes, type: :lib do
  describe "::extract" do
    let(:extractor_call) { described_class.extract(recipes) }

    let(:recipes) do
      [
        {
          "title" => "Golden Sweet Cornbread",
          "cook_time" => 25,
          "prep_time" => 10,
          "ingredients" => [
            "1 cup all-purpose flour",
            "1 cup yellow cornmeal",
            "⅔ cup white sugar",
            "1 teaspoon salt",
            "3 ½ teaspoons baking powder",
            "1 egg",
            "1 cup milk",
            "⅓ cup vegetable oil"
          ],
          "ratings" => 4.74,
          "cuisine" => "",
          "category" => "Cornbread",
          "author" => "bluegirl",
          "image" => "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F43%2F2021%2F10%2F26%2Fcornbread-1.jpg"
        }
      ]
    end

    it "creates a recipe from the dataset" do
      expect { extractor_call }
        .to change(Recipe, :count).by(1)
    end
  end
end
