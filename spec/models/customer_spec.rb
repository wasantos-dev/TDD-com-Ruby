require 'rails_helper'

RSpec.describe Customer, type: :model do

  fixtures :customers

  it 'Sobrescrevendo Atributo' do
    customer = create(:customer, name: "Jackson Pires")
    expect(customer.full_name).to eql("Sr. Jackson Pires")
  end

  it '#full_name' do
    customer = create(:customer)
    expect(customer.full_name).to start_with("Sr.")
  end

  it 'Herança' do
    customer = create(:customer_vip)
    expect(customer.vip).to eql(true)
  end

  it 'Usando attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with("Sr.")
  end

  it 'Atributo Transitório' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Cliente Masculino' do
    customer = create(:customer_male)
    expect(customer.gender).to eq('M')
  end

  it 'Cliente Feminino' do
    customer = create(:customer_female)
    expect(customer.gender).to eq('F')
  end

  it 'Cliente Vip' do
    customer = create(:customer_vip)
    expect(customer.vip).to eq(true)
  end

  it 'Cliente Default' do
    customer = create(:customer_default)
    expect(customer.vip).to eq(false)
  end

  it 'Cliente Masculino Vip' do
    customer = create(:customer_vip_male)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(true)
  end

  it 'Cliente Masculino Default' do
    customer = create(:customer_default_male)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(false)
  end

  it 'Cliente Feminino Vip' do
    customer = create(:customer_vip_female)
    expect(customer.gender).to eq('F')
    expect(customer.vip).to eq(true)
  end

  it 'Cliente Feminino Default' do
    customer = create(:customer_default_female)
    expect(customer.gender).to eq('F')
    expect(customer.vip).to eq(false)
  end

  it 'travel_to' do
    travel_to Time.zone.local(2004, 11, 23, 01, 04, 44) do
      @customer = create(:customer_vip)
    end

    expect(@customer.created_at).to be < Time.now
  end

  it { expect{create(:customer) }.to change{Customer.all.size}.by(1) }
end
