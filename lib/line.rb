class Line

    attr_reader :name
    attr_reader :stations

    def initialize (name)
        @name = name
        @stations = []
    end

    def add_station (station)
        @stations << station
        station.add_line(self)
    end

    def route (start_station, end_station)
        start_index = @stations.index(start_station)
        end_index = @stations.index(end_station)
        fn = (start_index < end_index ? :upto : :downto)
        output = []
        start_index.send(fn, end_index) do |index|
            output << @stations[index]
        end
        output
    end
end
