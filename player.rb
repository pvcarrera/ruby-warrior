class Player
  def play_turn(warrior)
    @warrior = warrior
    if(is_free?)
      free_action
    else
      warrior.attack!
    end
  end

  def need_rest?
    @warrior.health < 20
  end

  def is_free?
    @warrior.feel.empty?
  end

  def free_action
    if(need_rest?)
      @warrior.rest!
    else
      @warrior.walk!
    end
  end

end