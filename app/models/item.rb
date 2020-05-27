class Item < ApplicationRecord
  QUALITY_MAX = 50

  validates :name, presence: true
  validates :sell_in, presence: true
  validates :quality, presence: true

  after_validation :quality_limit_compliance

  def perish!
    update_sell_in!
    update_quality!
    save
  end

  private

  def quality_limit_compliance
    self.quality = 0 if quality.negative?
    self.quality = QUALITY_MAX if quality > QUALITY_MAX
  end

  def update_quality!
    self.quality -= sell_in.positive? ? 1 : 2
  end

  def update_sell_in!
    self.sell_in -= 1
  end
end
