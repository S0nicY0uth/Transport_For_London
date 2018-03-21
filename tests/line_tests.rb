describe Line do
  before do
    @victoria_line = Line.new('victoria')
    @oxford_circus = Station.new('oxford circus')
    @warren_street = Station.new('warren street')
  end

  describe "creating a line" do
    it 'should have a name attribute' do
      @victoria_line.name.must_equal('victoria')
    end
  end

  describe "having stations" do
    it 'should have stations' do
      @victoria_line.stations.class.must_equal(Array)
    end
    it 'should allow adding stations' do
      @victoria_line.add_station(@oxford_circus)
      @victoria_line.stations.must_equal([@oxford_circus])
    end
    it 'should preserve order of stations' do
      @victoria_line.add_station(@oxford_circus)
      @victoria_line.add_station(@warren_street)
      @victoria_line.stations.must_equal([@oxford_circus,@warren_street])
    end
    it "should add itself to the station's list of lines" do
      @victoria_line.add_station(@oxford_circus)
      @oxford_circus.lines.must_equal([@victoria_line])
    end
  end

  describe "routing" do
    before do
      @oval = Station.new('Oval')
      @angel = Station.new('Angel')
      @victoria_line.add_station(@oxford_circus)
      @victoria_line.add_station(@warren_street)
      @victoria_line.add_station(@oval)
      @victoria_line.add_station(@angel)
    end
    it "should return a list of stations between two points" do
      @victoria_line.stations_between(@oxford_circus, @oval).must_equal([@oxford_circus, @warren_street, @oval])
    end
    it "should return a list of stations between two points in opposite direction" do
      @victoria_line.stations_between(@oval, @oxford_circus).must_equal([@oval, @warren_street, @oxford_circus])
    end
    it "should return the station if the stations are the same" do
      @victoria_line.stations_between(@oval, @oval).must_equal([@oval])
    end
  end
end
