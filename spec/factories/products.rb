FactoryBot.define do

  factory :product do
    description          {"今冬の新作です"}        
    name                {"yamada"}
    price               {600}
    delivery_charged    {"送付者"}
    area                {"北海道"}
    delivery_days       {5}
    sales_status        {1}
    delivery_way        {1}
    user_id             {1}
    category_id         {1}
    brand_id            {1}
    size_id            {1}
    # statu_id            {1}
  end

end

