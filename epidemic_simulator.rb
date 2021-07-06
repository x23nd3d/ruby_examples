class Node
  attr_reader :state

  def initialize
    @state = false
  end

  def fire(all_nodes)
    return if state

    @state = true
    random_objects = random(all_nodes)
    random_objects.each { |object| object.fire(all_nodes) }
  end

  private

  def random(all_nodes)
    random_objects = []
    while random_objects.count != 3
      rand_number = rand(0..all_nodes.count - 1)
      next if all_nodes[rand_number] == self
      next if random_objects.include?(all_nodes[rand_number])

      random_objects.push(all_nodes[rand_number])
    end
    random_objects
  end
end

class NodeProtocol
  attr_reader :nodes

  def initialize(nodes)
    @nodes = nodes
  end

  def call
    puts calculate
  end

  private

  def create_objects
    (1..nodes).map { Node.new }
  end

  def send
    connections = create_objects
    connections.first.fire(connections)
    connections
  end

  def calculate
    connections = send
    count = 0

    connections.each do |item|
      next if item.state == false

      count += 1
    end
    percentage = count * 100 / nodes

    "% of received nodes = #{percentage}%"
  end

end



NodeProtocol.new(500).call