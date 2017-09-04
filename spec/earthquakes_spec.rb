describe Earthquakes do
  let(:properties1) do
    {
      'mag' => 2.5,
      'time' => 1504535113904,
      'updated' => 1504535325972,
      'title' => 'M 2.5 - 101km NE of Chignik Lake, Alaska'
    }
  end

  let(:properties2) do
    {
      'mag' => 4.5,
      'time' => 1504528715870,
      'updated' => 1504529542040,
      'title' => "M 4.5 - 149km S of Ust'-Kamchatsk Staryy, Russia"
    }
  end

  let(:data) do
    {
      'metadata' => {
        'generated' => 1504540475000,
        'url' => 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson',
        'title' => 'USGS Magnitude 2.5+ Earthquakes, Past Day',
        'status' => 200,
        'api' => '1.5.8',
        'count' => 45
      },
      'features' => [
        { 'type' => 'Feature', 'properties' => properties1 },
        { 'type' => 'Feature', 'properties' => properties2 }
      ]
    }
  end

  describe 'run' do
    it 'runs' do
      uri = URI(Earthquakes::DATA_URL)
      expect(Net::HTTP).to receive(:get).with(uri).and_return(data.to_json)
      Earthquakes.run
    end
  end

  describe 'features' do
    it 'extracts features from geojson' do
      result = Earthquakes.features(data)
      expected = [properties1, properties2]
      expect(result).to eql(expected)
    end
  end

  describe 'earthquake_info' do
    it 'extracts earthquake info from properties' do
      result = Earthquakes.earthquake_info(properties1)
      expect(result).to match(properties1['title'])
    end
  end
end
