# keyboard.rb

class Dungeon::Keyboard
  attr_accessor :type
  def initialize(translation)
    @type = Dungeon::STD_CONTROLS
    @translation = translation
    @keys = {}
    @triggered_keys = []
  end
  def set(key, &reaction)
    @keys[key] = reaction
  end
  def trigger(id)
  	@triggered_keys << @translation[id]
  end
  def react
    @keys.each do |key, reaction|
      if @triggered_keys.include? key
        reaction.call
      end
    end
    @triggered_keys = []
  end
  def reset
    @keys = {}
  end
end