class Station

    attr_reader :name, :lines

    def initialize (name)
        @name = name
        @lines = []
    end

    def add_line(line)
        @lines << line
    end

    def route_to(station)
        @lines.first.route(self, station)
    end

    def to_s
        @name
    end
end