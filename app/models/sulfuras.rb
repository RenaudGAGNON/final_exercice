class Sulfuras < Item
  after_initialize :set_name

  # Skip sell_in presence validator.
  _validators.dig(:sell_in).reject! do |validator|
    validator.is_a?(ActiveRecord::Validations::PresenceValidator)
  end

  def set_name
    self.name= "Sulfuras"
  end

  def sell_in
    nil
  end

  def update_quality!

  end

  def update_sell_in!

  end
end
