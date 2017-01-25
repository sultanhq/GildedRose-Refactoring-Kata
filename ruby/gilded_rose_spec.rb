require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end

    it 'reduces the sellin day value by one' do
      items = [Item.new('foo', 10, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 9
    end

    it 'reduces the quality value by one' do
      items = [Item.new('foo', 10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 9
    end

    it 'brie increases in quality value by one' do
      items = [Item.new('Aged Brie', 10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 11
    end

    it "Quality doesn't get higher than 50" do
      items = [Item.new('Aged Brie', 10, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
    end

    it "Quality doesn't get lower than 0" do
      items = [Item.new('Foo', 1, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end


    it 'Sulfuras never change in sellin or quality values' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
      expect(items[0].sell_in).to eq 10
    end

    it "'Backstage passes to a TAFKAL80ETC concert'
         increases by 2 when between 10 & 5 days before sell in" do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 12
    end

    it "'Backstage passes to a TAFKAL80ETC concert'
         increases by 3 when between 5 & 0 days before sell in" do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 13
    end

    it "'Backstage passes to a TAFKAL80ETC concert'
         drops to 0 after sell in hit 0" do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end

    it 'Conjured items reduce the quality value by two' do
      items = [Item.new('Conjured', 10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 8
    end
  end
end
