RSpec.describe Hyakumeizan::List do

  describe '.all' do
    it 'return all mountain data' do
      expect(Hyakumeizan::List.all.size).to eq(100)
    end
  end

  describe '.filter_by_prefecture' do
    context 'when some mountain data matched from input prefecture' do
      it 'return filtered mountain data from prefecture' do
        expect(Hyakumeizan::List.filter_by_prefecture('長野県').size).to eq(18)
      end
    end

    context "when data did not match" do
      it 'return []' do
        expect(Hyakumeizan::List.filter_by_prefecture('最強県').size).to eq(0)
      end
    end
  end

  describe '.find_by_name_ja' do
    context 'when find a mountain name in data' do
      it 'return target mountain object' do
        expected_hash = {
          name_ja: '蓼科山',
          name_en: 'tateshinayama',
          latitude: 36.103722222222224,
          longtitude: 138.29494444444444,
          height: '2530m',
          prefecture: '長野県'
        }
        expect(Hyakumeizan::List.find_by_name_ja('蓼科山')).to eq(expected_hash)
      end
    end

    context "when can't find mountain name in data" do
      it 'return Hyakumeizan::List::NoMountainDataError' do
        expect{ Hyakumeizan::List.find_by_name_ja('高尾山') }.to raise_error(Hyakumeizan::List::NoMountainDataError)
      end
    end
  end
end
