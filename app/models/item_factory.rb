class ItemFactory
  def create_item(type:, name:, quality:, sell_in:)
    factory_type = (type.capitalize.constantize rescue nil) || Item
    factory_type.create name, quality, sell_in
  end
end
