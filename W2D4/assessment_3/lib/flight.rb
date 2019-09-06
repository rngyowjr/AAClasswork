class Flight
    def initialize(num, cap)
        @flight_number = num
        @capacity = cap
        @passengers = []        
    end

    attr_reader :passengers

    def full?
        @passengers.length >= @capacity
    end

    def board_passenger(pass)
        @passengers << pass if pass.has_flight?(@flight_number) && !full?
    end

    def list_passengers
        @passengers.map {|pass| pass.name}
    end

    def [](idx)
        @passengers[idx]
    end

    def <<(pass)
        board_passenger(pass)
    end
end