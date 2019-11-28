FactoryBot.define do

  factory :product do
    description          {"今冬の新作です"}        
    name                {"yamada"}
    price               {600}
    delivery_charged    {1}
    area                {1}
    delivery_days       {1}
    sales_status        {1}
    delivery_way        {1}
    user_id             {1}
    category_id         {1}
    brand              {'ナイキ'}
    size_id             {1}
    status_id           {1}
    # product_id          {1}

    # カラム修正ありうる 191122 髙橋
  end

end

