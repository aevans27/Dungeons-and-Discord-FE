class Character
  attr_reader :id, :char_class

  def initialize(data)
    @id = data[:attributes][:user_id]
    @char_class = data[:attributes][:char_class]
  end
end