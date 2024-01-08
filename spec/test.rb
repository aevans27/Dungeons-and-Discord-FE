require 'rails_helper'

describe "class requests for API" do
  it "sends a list of classes" do
    CharacterFacade.create_character("/api/v1/characters", {user_id: 1, char_class: "barbarian" })
    expect(response).to be_successful
  end
end