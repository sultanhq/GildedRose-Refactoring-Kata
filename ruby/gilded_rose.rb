class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      decrease_sell_in(item)
      change_quality(item)
    end
  end

  def decrease_sell_in(item)
    unless item.name == "Sulfuras, Hand of Ragnaros"
      item.sell_in = item.sell_in - 1
    end
  end

  def change_quality(item)
    quality_matrix = {"foo" => -1, "Conjured" => -2, "Aged Brie" => +1, "Sulfuras, Hand of Ragnaros" => 0}
    if item.quality < 50
      if item.name != "Backstage passes to a TAFKAL80ETC concert"
        item.quality = item.quality + quality_matrix[item.name]
      else
        update_pass_quality(item)
      end
    end
  end

  def update_pass_quality(item)
    if item.sell_in < 0
      item.quality = 0
    elsif item.sell_in < 6
      item.quality += 3
    else
      item.quality += 2
    end
  end

end


class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
