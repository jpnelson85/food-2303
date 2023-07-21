class FoodService
  
  def search_foods(food)
    get_url("/foods/search?query=#{food}")
  end

  private

  def conn
    Faraday.new(url: "https://api.nal.usda.gov/fdc/v1") do |f|
      f.params["api_key"] = ENV["FOOD_API_KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end