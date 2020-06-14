class Scene
  def enter()
    puts "This scene is not yet configured. Subclass it and implement enter()."
    exit(1)
  end
end

class Death < Scene
  @@quips = [
    "You died.  You kinda suck at this.",
     "Your mom would be proud...if she were smarter.",
     "Such a luser.",
     "I have a small puppy that's better at this."
  ]

  def enter()
    puts "-" * 10
    puts @@quips[rand(0..(@@quips.length - 1))]
    puts "You are dead."
    exit(1)
  end
end

class Entrance < Scene

  def enter()
    puts "Here is the entrance. There is a grizzly bear staring at you. Behind him is a door."
    puts "What do you do?"

    action = $stdin.gets.chomp

    if action == "sneak"
      puts "You cannot sneak beside a bear thats alive and staring at you."
      return 'death'
    elsif action == "attack"
      puts "You try to wrestle the bear. That was stupid."
      return 'death'
    elsif action == "run"
      puts "You run around, the bear gets confused and you manage to reach the door."
      return "goldroom"
    else
      puts "I don't understand."
      return 'entrance'
    end
  end

end

class TrapRoom < Scene
  def enter()
    puts "Still working on TrapRoom"
    return 'entrance'
  end
end

class GoldRoom < Scene
  @@rewards = {
    "red" => "a pile of gold",
    "blue" => "a key to the castle",
    "orange" => "a plush bear toy",
  }

  def enter()
    puts "This room is made of gold. There are three chests. Red, blue and orange. Which one do you choose?"

    selection = $stdin.gets.chomp
    until @@rewards.key?(selection)
      puts "Which one do you choose?"
      selection = $stdin.gets.chomp
    end

    puts "You find #{@@rewards[selection]} in the chest."
    return 'finished'
  end
end

class Finished < Scene
  def enter()
    puts "You won! Good job."
  end
end
