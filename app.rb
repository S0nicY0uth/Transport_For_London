require './lib/line'
require './lib/station'
require './lib/data'
require 'pry'

all_stations = {}

Station_data.each do |line,stations|
    l=Line.new(line)
    stations.each do |station|
        all_stations[station.downcase] ||= Station.new(station)
        l.add_station(all_stations[station.downcase])
    end
end

print 'Enter starting station name: '
while !(input=gets.chomp.downcase).include?('quit')
    if all_stations[input]
        start_station=all_stations[input]
    end
    print 'Enter destination station name: '
    input=gets.chomp.downcase
    if all_stations[input]
      end_station=all_stations[input]
    end

    route = start_station.lines[0].route(start_station,end_station)
    route.each do |c|
      puts c.name
    end
end
