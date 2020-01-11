FactoryBot.define do
  factory :order do
  	sequence(:description) { |n| "Pedido numero - #{n}"}
  	customer
  end
end
