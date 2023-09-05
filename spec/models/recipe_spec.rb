RSpec.describe Recipe do
  describe "Validations" do
    describe "title" do
      it { is_expected.to validate_presence_of(:title) }
    end

    describe "cook_time" do
      it { is_expected.to validate_presence_of(:cook_time) }
      it { is_expected.to validate_numericality_of(:cook_time).only_integer.is_greater_than_or_equal_to(0) }
    end

    describe "prep_time" do
      it { is_expected.to validate_presence_of(:prep_time) }
      it { is_expected.to validate_numericality_of(:prep_time).only_integer.is_greater_than_or_equal_to(0) }
    end

    describe "ingredients" do
      it { is_expected.to validate_presence_of(:ingredients) }
    end

    describe "rating" do
      it { is_expected.to validate_presence_of(:rating) }

      it do
        is_expected.to validate_numericality_of(:rating).is_greater_than_or_equal_to(0)
                                                        .is_less_than_or_equal_to(5)
      end
    end

    describe "image_url" do
      it { is_expected.to validate_presence_of(:image_url) }

      describe "format: VALID_URL_REGEX" do
        context "with a valid url" do
          let(:recipe_with_valid_url) { build(:recipe, image_url: "https://google.com") }

          it "is valid" do
            expect(recipe_with_valid_url)
              .to be_valid
          end
        end

        context "with an invalid url" do
          let(:recipe_with_invalid_url) { build(:recipe, image_url: "postgresql://google.com") }

          it "is valid" do
            expect(recipe_with_invalid_url)
              .not_to be_valid
          end
        end
      end
    end
  end

  describe "Callbacks" do
    describe "before_create" do
      describe "#set_is_vegetarian" do
        let(:recipe) { build(:recipe, ingredients:) }
        let(:ingredients) { [veggie_ingredient, test_ingredient] }
        let(:veggie_ingredient) { "⅓ cup vegetable oil" }

        context "when the recipe has 1 or more 'meat' ingredient" do
          let(:test_ingredient) { "1 (2 pound) ham steak, cut into 1-inch pieces" }

          it "sets is_vegetarian value to false" do
            recipe.save!

            expect(recipe.is_vegetarian)
              .to be false
          end
        end

        context "when the recipe does not have a 'meat' ingredient" do
          let(:test_ingredient) { "10 Brussels sprouts, halved" }

          it "sets is_vegetarian value to true" do
            recipe.save!

            expect(recipe.is_vegetarian)
              .to be true
          end
        end
      end
    end
  end
end
