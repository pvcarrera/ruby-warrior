class Player
  def play_turn(warrior)
    @warrior = warrior
    if(is_free?)
      free_action
    else
      warrior.attack!
    end
    @health = @warrior.health
  end

  def need_rest?
    @warrior.health < 20
  end

  def is_free?
    @warrior.feel.empty?
  end

  def can_rest?
    @warrior.health >= @health
  end

  def free_action
    if(need_rest? && can_rest?)
      @warrior.rest!
    else
      @warrior.walk!
    end
  end

end