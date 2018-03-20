require './lib/line'
require './lib/station'
require './lib/data'
require 'pry'

all_stations = {}

Station_data.each do |line,stations|
    l=Line.new(line)
    stations.each do |station|
        s=Station.new(station)
        l.add_station(s)
        all_stations[station.downcase] = s
    end
end

run = true
while run 
    print 'Enter starting station name: '
    input=gets.chomp.downcase
    if all_stations[input] 
        start_station=all_stations[input]
        run=false
        binding.pry
    end
end

        
