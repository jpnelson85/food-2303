require "rails_helper"

RSpec.describe "Food Service" do
  describe "instance methods" do
    it "returns food data" do
      food_service = FoodService.new
      food = food_service.search_foods("sweet potatoes")

      expect(food).to be_a(Hash)
      expect(food.keys.count).to eq(7)
    end
  end
end