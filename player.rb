class Player

  MAX_HEALTH = 20

  def initialize
    @direction = :backward
    @full_recover = false
  end

  def play_turn(warrior)
    @warrior = warrior
    if(is_free?)
      free_action
    else
      item_action
    end
    @health = @warrior.health
  end

  def need_rest?
    @warrior.health < MAX_HEALTH && !@full_recover
  end

  def is_free?
    @warrior.feel(@direction).empty?
  end

  def can_rest?
    @warrior.health >= @health
  end

  def free_action
    if(need_rest?)
      rest_action
    else
      @warrior.walk!(@direction)
    end
  end

  def rest_action
    if can_rest?
      @full_recover = true if @warrior.health == MAX_HEALTH - 2
      @warrior.rest!
    else
      @warrior.walk!(:backward)
    end
  end

  def item_action
    case
    when @warrior.feel(@direction).captive? then
      @warrior.rescue!(@direction)

    when @warrior.feel(@direction).wall? then
      @direction = :forward
      @warrior.walk!(@direction)

    else
      if @direction == :backward
        @warrior.pivot!
      else
        @warrior.attack!(@direction)
      end
    end
  end

end