class FoodService
  
  def search_foods(food)
    get_url("/foods/search?query=#{food}")
  end

  private

  def conn
    Faraday.new(url: 'https://api.nal.usda.gov/fdc/v1') do |f|
      faraday.params['api_key'] = ENV['FOOD_API_KEY']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end

As a user,
When I visit "/"
And I fill in the search form with "sweet potatoes"
(Note: Use the existing search form)
And I click "Search"
Then I should be on page "/foods"
Then I should see a total of the number of items returned by the search.
(sweet potatoes should find more than 30,000 results)
Then I should see a list of TEN foods that contain the ingredient "sweet potatoes"

And for each of the foods I should see:
- The food's GTIN/UPC code
- The food's description
- The food's Brand Owner
- The food's ingredients