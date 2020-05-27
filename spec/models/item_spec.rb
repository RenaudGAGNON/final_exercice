RSpec.describe 'Item' do
  let(:name) { 'item_name' }
  let(:quality) { 40 }
  let(:sell_in) { 10 }

  describe :quality_limit_compliance do
    subject(:item){ Item.create(type: :item, name: name, quality: quality, sell_in: sell_in) }
    context 'when quality is over 50' do
      let(:quality) { 60 }

      it{pp item ; expect(item).to have_attributes(type: :item, name: name, quality: Item::QUALITY_MAX)}
    end
    context 'when quality is under 0' do
      let(:quality) { -2 }
      it{expect(subject).to have_attributes(type: :item, name: name, quality: 0)}
    end
  end
end
