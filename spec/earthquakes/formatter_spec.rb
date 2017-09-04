describe Earthquakes::Formatter do
  let(:properties) do
    {
      'mag' => 2.5,
      'title' => 'M 2.5 - 101km NE of Chignik Lake, Alaska'
    }
  end

  describe 'earthquake_info' do
    it 'extracts earthquake info from properties' do
      result = Earthquakes.earthquake_info(properties)
      expect(result).to match(properties['title'])
    end
  end

  describe 'magnitude_to_sym' do
    it 'verifies magnitudes' do
      expected = {
        minor: 3.9,
        light: 4.9,
        moderate: 5.9,
        strong: 6.9,
        major: 7.9,
        great: 8.0
      }
      expected.each do |sym, mag|
        expect(Earthquakes.magnitude_to_sym(mag)).to be(sym)
      end
    end
  end

end
