RSpec.describe 'gift shop', :gift_shop do
  describe Item, :gift_shop_item do
    it 'returns own weight' do
      item = Item.new(weight: 100)

      expect(item.total_weight).to eq(100)
    end
  end

  describe Box, :gift_shop_box do
    it 'inherits from Item' do
      expect(Box.superclass).to be(Item)
    end

    it 'returns own weight when empty' do
      box = Box.new(weight: 100, items: [])

      expect(box.total_weight).to eq(100)
    end

    it 'adds weight of all containing items' do
      box = Box.new(weight: 100, items: [Item.new(weight: 300),
                                         Item.new(weight: 200)])
      expect(box.total_weight).to eq(600)
    end

    context 'when contains other boxes' do
      it 'adds weight of all containing boxes' do
        box = Box.new(weight: 100,
                      items: [Item.new(weight: 250),
                              Box.new(weight: 50, items: [Item.new(weight: 100)]),
                              Box.new(weight: 50, items: [Box.new(weight: 20,
                                                                  items: [Item.new(weight: 30)])])])

        expect(box.total_weight).to eq(600)
      end
    end
  end
end
