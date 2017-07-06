require "test_helper"

describe Recipe do
  describe "validitiy" do
    let(:recipe) { Recipe.new }

    before do
      recipe.valid?
    end
    it "requires a user"
      recipe.errors[:user].must_include "can't be blank"
    end
    it "requires a description"
      recipe.errors[:description].must_include "can't be blank"
    end
    it "requires a name"
      recipe.errors[:name].must_include "can't be blank"
    end
    it "requires the name to be unique for the same user"
      existing_recipe = create(:recipe)
      recipe.name = existing_recipe.name
      recipe.user = existing_recipe.user
      recipe.valid?

      recipe.errors[:name].must_include "has already been taken"
    end


      it "does not require the name to be unique for different users"
      existing_recipe = create(:recipe)
      recipe.name = existing_recipe.name
      recipe.valid?

      recipe.errors[:name].wont_include "has already been taken"
  end
end
