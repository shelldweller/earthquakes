describe Earthquakes do
  it 'runs' do
    uri = URI(Earthquakes::DATA_URL)
    expect(Net::HTTP).to receive(:get).with(uri)
    Earthquakes.run
  end
end
