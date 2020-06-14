require "./ex45_scenes.rb"


class Map
  @@scenes = {
    'death' => Death.new(),
    'entrance' => Entrance.new(),
    'traproom' => TrapRoom.new(),
    'goldroom' => GoldRoom.new(),
    'finished' => Finished.new(),
  }

  def initialize(start_scene)
    @start_scene = start_scene
  end

  def next_scene(scene_name)
    return @@scenes[scene_name]
  end

  def opening_scene()
    return next_scene(@start_scene)
  end
end
