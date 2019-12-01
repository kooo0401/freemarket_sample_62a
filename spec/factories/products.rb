FactoryBot.define do

  factory :product do
    description         {"今冬の新作です"}
    name                {"yamada"}
    price               {600}
    delivery_charged    {"shipping_fee_on_shipper"}
    prefecture_id       {1}
    delivery_days       {"days1_2"}
    sales_status        {"unused"}
    delivery_way        {"kuroneko_yamato"}
    user_id             {1}
    category_id         {1}
    brand               {"ナイキ"}
    size_id             {1}
    status_id           {1}
  end
end

