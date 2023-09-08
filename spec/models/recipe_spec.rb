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
end
