class Passenger 
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    attr_reader :name

    def has_flight?(num)
        return @flight_numbers.include?(num.upcase)
    end

    def add_flight(num)
        @flight_numbers << num.upcase if !has_flight?(num)
    end
end