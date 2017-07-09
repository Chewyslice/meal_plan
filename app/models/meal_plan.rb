  class MealPlan < ApplicationRecord
    belongs_to :user
    has_many :meals

    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :user, presence: true

    def build_meals
    end
  end
