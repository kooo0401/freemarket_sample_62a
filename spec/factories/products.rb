FactoryBot.define do

  factory :product do
    description          {"今冬の新作です"}        
    name                {"yamada"}
    price               {100}
    delivery_charged    {"送付者"}
    area                {"送付者"}
    delivery_days       {"送付者"}
    sales_status        {1}
    delivery_way        {1}
    user_id             {1}
    category_id         {1}
    brand_id            {1}
  end

end