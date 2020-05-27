class StoreService

  def next_day
    ActiveRecord::Base.transaction do
      Item.all.each do |item|
        item.perish!
      end
    end
  end
end
