describe Station do
    before do
        @charing_cross = Station.new('Charing Cross')
        @victoria_line = Line.new("victoria")
    end
    describe "creating a station" do
        it 'should have a name attribute' do
            @charing_cross.name.must_equal('Charing Cross')
        end
    end

    describe "adding lines" do
        it 'should be able to be assigned to a line' do
            @charing_cross.add_line(@victoria_line)
            @charing_cross.lines.must_equal([@victoria_line])
        end
    end

    describe "finding a route" do
        before do
            @oval = Station.new('Oval')
            @angel = Station.new('Angel')
            @camden = Station.new("Camden")
            @victoria_line.add_station(@charing_cross)
            @victoria_line.add_station(@oval)
            @victoria_line.add_station(@angel)
            @victoria_line.add_station(@camden)
        end
        it "should return a list of stations between two points" do
            @charing_cross.route_to(@angel).must_equal([@charing_cross, @oval, @angel])
        end

        describe 'multiple lines' do
          before do
            @holborn = Station.new('Holborn')
            @queensway = Station.new('Queensway')
            @embankment = Station.new('Embankment')
            @bakerloo = Line.new('Bakerloo')
            @bakerloo.add_station(@holborn)
            @bakerloo.add_station(@oval)
            @bakerloo.add_station(@queensway)
            @bakerloo.add_station(@embankment)
          end
          it "should return a route across multiple lines" do
            @camden.route_to(@embankment).must_equal([@camden,@angel,@oval, @queensway,@embankment])
          end
        end
    end

end
