class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            if item.name != "Conjured"
              decrease_quality(item,1)
            else
              decrease_quality(item,2)
            end
          end
        end
      else
        if item.quality < 50
          increase_quality(item,1)
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                increase_quality(item,1)
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                increase_quality(item,1)
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        decrease_sell_in(item)
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                decrease_quality(item,1)
              end
            end
          else
            decrease_quality(item,item.quality)
          end
        else
          if item.quality < 50
            increase_quality(item,1)
          end
        end
      end
    end
  end
end

def decrease_quality(item,reduction)
  item.quality = item.quality - reduction
end

def increase_quality(item,increament)
  item.quality = item.quality + increament
end

def decrease_sell_in(item)
  item.sell_in = item.sell_in - 1
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
