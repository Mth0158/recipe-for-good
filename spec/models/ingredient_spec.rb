RSpec.describe Ingredient do
  describe "Validations" do
    describe "name" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_uniqueness_of(:name) }
    end
  end

  describe "Callbacks" do
    describe "before_create" do
      describe "#set_is_featured" do
        let(:ingredient) { build(:ingredient, name:) }

        context "when the ingredient belongs to the featured list" do
          let(:name) { Ingredient::FEATURED.sample }

          it "sets is_featured value to true" do
            ingredient.save!

            expect(ingredient.is_featured)
              .to be true
          end
        end

        context "when the ingredient does not belong to the featured list" do
          let(:name) { "Black beans" }

          it "sets is_featured value to true" do
            ingredient.save!

            expect(ingredient.is_featured)
              .to be false
          end
        end
      end
    end
  end
end
