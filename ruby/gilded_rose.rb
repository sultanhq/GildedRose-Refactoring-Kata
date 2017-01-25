class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      change_quality(item)
      decrease_sell_in(item)
    end
  end

  def decrease_sell_in(item)
    item.sell_in = item.sell_in - 1 unless
      item.name == 'Sulfuras, Hand of Ragnaros'
  end

  def change_quality(item)
    quality_matrix = { item.name => -1, conjoured_item = item.name.include?('Conjured') ? item.name : nil => -2,
                       'Aged Brie' => +1, 'Sulfuras, Hand of Ragnaros' => 0 }
    if item.quality <= 50
      if item.name != 'Backstage passes to a TAFKAL80ETC concert'
        ammend_quality(item, quality_matrix[item.name])
      else
        update_pass_quality(item)
      end
    end
  end

  def ammend_quality(item, quantity)
    item.quality = item.quality + quantity
    item.quality = 0 if item.quality < 1
    item.quality = 50 if item.quality > 50
  end


  def update_pass_quality(item)
    if item.sell_in < 1
      item.quality = 0
    elsif item.sell_in < 6
      ammend_quality(item, 3)
    else
      ammend_quality(item, 2)
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

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
