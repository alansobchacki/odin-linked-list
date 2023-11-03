class LinkedList
  def initialize(value)
    @head = Node.new(value, nil)
    @tail = @head
    @length = 1
  end

  def append(value)
    new_node = Node.new(value, nil)
    @tail.next_node = new_node
    @tail = new_node
    @length += 1
  end

  def prepend(value)
    @head = Node.new(value, @head)
    @length += 1
  end

  def at(index)
    if index < 0 || index >= @length
      puts "Index out of bounds. The linked list has #{@length} nodes."
      return
    end
  
    current = @head
    index.times do
      current = current.next_node
    end
  
    puts "Node at index #{index}: #{current}. Value: #{current.value}."
  end

  def pop
    return if @length == 1

    current = @head
  
    (@length - 2).times do
      current = current.next_node
    end
  
    current.next_node = nil
    @tail = current
    @length -= 1    
  end

  def contains?(value)
    current = @head
    values = []

    @length.times do
      values.push(current.value)
      current = current.next_node
    end

    p values.include?(value)
  end

  def find(value)
    current = @head
    index = 0

    if contains?(value) == false then
      p nil
    else
      until current.value == value
        current = current.next_node
        index += 1
      end
    end

    puts "The value of #{value} is located in the node with an index of #{index}."
  end

  def insert_at(value, index)
    if index < 0 || index > @length
      puts "Index out of bounds. The linked list has #{@length} nodes."
      return
    elsif index == 0
      prepend(value)
    elsif index == @length
      append(value)
    else
      current = @head
      (index - 1).times do
        current = current.next_node
      end
  
      new_node = Node.new(value, current.next_node)
      current.next_node = new_node
      @length += 1
    end
  end

  def remove_at(index)
    if index < 0 || index >= @length
      puts "Index out of bounds. The linked list has #{@length} nodes."
      return
    elsif (index + 1) == @length
      pop
    elsif index == 0
      @head = @head.next_node
      @length -= 1
    else
      current = @head
      (index - 1).times do
        current = current.next_node
      end

      current.next_node = current.next_node.next_node
      @length -= 1
    end
  end

  def to_s
    current = @head
    string = ""

    @length.times do
      string << '( ' << current.value.to_s << ' ) -> '
      current = current.next_node 
    end

    string << 'nil'
    puts string
  end

  def size
    puts "Your linked list has #{@length} nodes total."
  end

  def head
    puts "The first node of your linked list is #{@head}, with a value of #{@head.value}."
  end

  def tail
    puts "The last node of your linked list is #{@tail}, with a value of #{@tail.value}."
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end
end

# We test our methods with the code below

list = LinkedList.new(30)

list.append(15)
list.prepend(7)
list.append(80)
list.insert_at(999, 2)
list.to_s

list.at(2)
list.contains?(15)
list.contains?('clown')
list.find(999)
list.size
list.head
list.tail
list.pop
list.to_s
list.remove_at(3)
list.to_s