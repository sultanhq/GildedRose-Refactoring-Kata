require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "reduces the sellin day value by one" do
      items = [Item.new("foo", 10, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
    end

    it "reduces the quality value by one" do
      items = [Item.new("foo", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 9
    end

    it "reduces the sellin day value by one" do
      items = [Item.new("foo", 10, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
    end

    it "brie increases in quality value by one" do
      items = [Item.new("Aged Brie", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 11
    end

    it "Quality doesn't get higher than 50" do
      items = [Item.new("Aged Brie", 10, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end

    it "Sulfuras never change in sellin or quality values" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
      expect(items[0].sell_in).to eq 10
    end

  end

end
