require "test_helper"

describe MealPlan do
  describe "validity" do
    let(:meal_plan) { MealPlan.new }

    before do
      meal_plan.valid?
    end

    it "requires a start_date" do
      meal_plan.errors[:start_date].must_include "can't be blank"
    end

    it "requires an end_date" do
      meal_plan.errors[:end_date].must_include "can't be blank"
    end

    it "requires a user" do
      meal_plan.errors[:user].must_include "can't be blank"
    end
  end

  describe "generating a weekly plan" do
    let(:meal_plan) { build(:meal_plan) }

    before do
      7.times do
        create(:recipe, user: meal_plan.user)
      end
    end

    it "populates a meal for each day between the start date and the end date" do
      meal_plan.meals.size.must_equal 0

      meal_plan.build_meals

      meal_plan.meals.size.must_equal 7
    end
  end
end
