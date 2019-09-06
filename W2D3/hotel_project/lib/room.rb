class Room
    attr_accessor :capacity, :occupants

    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end


    def full?
        @occupants.length == @capacity  
    end


    def available_space
        @capacity - @occupants.length
    end


    def add_occupant(name)
        if !self.full?
            @occupants << name
            return true
        end
        false
    end
end
