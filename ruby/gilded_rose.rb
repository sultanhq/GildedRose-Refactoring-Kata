class GildedRose


  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          change_quality(item)
        end
      else
            change_quality(item)
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        decrease_sell_in(item)
      end
      if item.sell_in < 0
        if item.name != "Backstage passes to a TAFKAL80ETC concert"
          if item.quality > 0
            change_quality(item)
          end
        else
          change_quality(item)
        end
      end
    end
  end
end

def decrease_sell_in(item)
  item.sell_in = item.sell_in - 1
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
