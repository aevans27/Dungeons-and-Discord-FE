class Character
  attr_reader :id, :char_class, :race, :background, :alignment, :name

  def initialize(data)
    @id = data[:attributes][:user_id]
    @char_class = data[:attributes][:char_class]
    @name = data[:attributes][:name]
    @race = data[:attributes][:race]
    @background = data[:attributes][:background]
    @alignment = data[:attributes][:alignment]
  end
end