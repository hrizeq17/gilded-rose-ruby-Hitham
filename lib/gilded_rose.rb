class GildedRose
  attr_reader :Item
  def self.new(name:, days_remaining:, quality:)
    @item= self.klass_for(name).new(quality, days_remaining)
  end
  def self.klass_for(name)
    case  name
      when 'Normal Item'
        Normal
      when 'Aged Brie'
        Brie
      when 'Sulfuras, Hand of Ragnaros'
        Sulfuras
      when 'Backstage passes to a TAFKAL80ETC concert'
        Backstage
        end 
      end
  
  def tick
    item.tick
  end

  def quality
    return item.quality
  end

  def days_remaining
    return item.days_remaining
  end

  class Normal
    attr_reader :quality, :days_remaining
    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end
    def tick
      @days_remaining -= 1
      return if @quality == 0

      @quality -= 1
      @quality -= 1 if @days_remaining <= 0
    end
  end

  class Brie
    attr_reader :quality, :days_remaining
    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick
      @days_remaining -= 1
      return if @quality >= 50

      @quality += 1
      @quality += 1 if @days_remaining <= 0 and quality < 50
    end
  end

  class Sulfuras
    attr_reader :quality, :days_remaining
    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end
    def tick
    end
  end

  class Backstage
    attr_reader :quality, :days_remaining
    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick
      @days_remaining -= 1
      return if @quality >= 50
      return @quality = 0 if @days_remaining < 0

      @quality += 1
      @quality += 1 if @days_remaining < 10
      @quality += 1 if @days_remaining < 5
    end
  end
end


