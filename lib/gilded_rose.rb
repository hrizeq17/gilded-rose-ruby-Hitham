module GildedRose
  class Item
    attr_reader :quality, :days_remaining

    def initialize(days_remaining:, quality:)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick
    end
  end

  class Normal < Item
    def tick
      @days_remaining -= 1
      return if @quality == 0

      @quality -= 1
      @quality -= 1 if @days_remaining <= 0
    end
  end

  class Brie < Item
    def tick
      @days_remaining -= 1
      return if @quality >= 50

      @quality += 1
      @quality += 1 if @days_remaining <= 0 && @quality < 50
    end
  end

  class Backstage < Item
    def tick
      @days_remaining -= 1
      return if @quality >= 50
      return @quality = 0 if @days_remaining < 0

      @quality += 1
      @quality += 1 if @days_remaining < 10
      @quality += 1 if @days_remaining < 5
    end
  end

  class Sulfuras < Item
    def tick
    end
  end

  class Conjured < Item
    def tick
      @days_remaining -= 1
      return if @quality == 0

      @quality -= 2
      @quality -= 2 if @days_remaining <= 0
    end
  end

  SPECIALIZED_CLASSES = {
    'Normal Item' => Normal,
    'Aged Brie' => Brie,
    'Backstage passes to a TAFKAL80ETC concert' => Backstage,
    'Sulfuras, Hand of Ragnaros' => Sulfuras,
    'Conjured Mana Cake' => Conjured
  }

  def self.new(name:, days_remaining:, quality:)
    (SPECIALIZED_CLASSES[name] || Item).new(days_remaining: days_remaining, quality: quality)
  end
end
