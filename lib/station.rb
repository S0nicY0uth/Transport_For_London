class Station

    attr_reader :name, :lines

    def initialize (name)
        @name = name
        @lines = []
    end

    def add_line(line)
        @lines << line
    end

    def direct_lines_to(station)
      @lines.select do |line|
        line.stations.include? station
      end
    end

    def junction_for(station)
      # Loop through our lines
      @lines.each do |line|
        # For each station on each line
        line.stations.each do |s|
          # Check if it has a line to our destination station
          return s if s.direct_lines_to(station).length > 0
        end
      end
    end

    def route_to(end_station)
      # find out if station is on one of our lines
      directLines = direct_lines_to(end_station)
      if directLines.length > 0
        # calculate the route to it
        directLines.first.stations_between(self, end_station)
      else
        # find a connecting station
        junction = junction_for(end_station)
        # break the route into two
        leg1 = (self.lines & junction.lines).first.stations_between(self, junction)
        leg2 = (junction.lines & end_station.lines).first.stations_between(junction, end_station)
        # join the routes together
        leg1.concat(leg2).uniq
      end
    end

    def to_s
        @name
    end

    def inspect
      "Station: #{@name}"
    end
end
