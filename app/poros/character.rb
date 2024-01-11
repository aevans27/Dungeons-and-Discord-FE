class Character
  attr_reader :id, :user_id, :char_class, :race, :background, :alignment, :name, :proficiencies, :items, :stats

  def initialize(data)
    @id = data[:attributes][:id]
    @user_id = data[:attributes][:user_id]
    @char_class = data[:attributes][:char_class]
    @name = data[:attributes][:name]
    @race = data[:attributes][:race]
    @background = data[:attributes][:background]
    @alignment = data[:attributes][:alignment]
    @proficiencies = data[:attributes][:character_proficiencies]
    @items = data[:attributes][:character_items]
    @stats = data[:attributes][:character_stat]
  end
end