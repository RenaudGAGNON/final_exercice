class AgedBrie < Item
  after_initialize :set_name

  def set_name
    self.name= "Aged Brie"
  end

  def update_quality!
    self.quality += 1
  end
end
