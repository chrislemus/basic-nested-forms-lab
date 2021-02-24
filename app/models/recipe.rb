class Recipe < ActiveRecord::Base
  has_many :ingredients 
  # accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(ingredients)
    ingredients.each do |ingredient|
      new_ingredient = Ingredient.find_or_create_by(name: ingredient[:name], quantity: ingredient[:quantity])
      self.ingredients << new_ingredient
    end
    
  end
end
