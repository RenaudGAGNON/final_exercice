class BackstagePass < Item
  after_initialize :set_name

  def set_name
    self.name= "Backstage Pass"
  end

  def update_quality!
    case sell_in
    when >=10
      quality += 1
    when 5..9
      quality += 2
    when 0..4
      quality += 3
    else
      quality = 0
    end
  end
end
