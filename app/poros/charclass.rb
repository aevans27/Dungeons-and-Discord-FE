class Charclass
  attr_reader :id, :index, :name, :url, :hit_die, :proficiency_choices, :proficiencies, :saving_throws, :starting_equipment, :starting_equipment_options, :subclass

  def initialize(attributes)
    # require 'pry';binding.pry
    @id = nil
    @index = attributes[:attributes][:index]
    @name = attributes[:attributes][:name]
    @url = attributes[:attributes][:url]
    @hit_die = attributes[:attributes][:hit_die]
    @proficiency_choices = attributes[:attributes][:proficiency_choices].first[:from][:options]
    @proficiencies = attributes[:attributes][:proficiencies]
    @saving_throws = attributes[:attributes][:saving_throws]
    @starting_equipment = attributes[:attributes][:starting_equipment]
    @starting_equipment_options = attributes[:attributes][:starting_equipment_options]
    @subclass = attributes[:attributes][:subclasses]
  end
end