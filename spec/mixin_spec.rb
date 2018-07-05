RSpec.describe 'mixin', :mixin do
  let(:contract_class) do
    Class.new do
      include Cloneable

      attr_reader :first_name, :last_name, :gender, :address

      def initialize(first_name, last_name, gender, address)
        @first_name = first_name
        @last_name = last_name
        @gender = gender
        @address = address
      end
    end
  end

  describe '#clone' do
    it 'builds new object' do
      contract = contract_class.new('Harry', 'Hole', 'male', 'Oslo')

      expect(contract).not_to be(contract.clone)
    end

    it 'copies instance variables' do
      contract = contract_class.new('Harry', 'Hole', 'male', 'Oslo')

      clone = contract.clone
      expect(clone.first_name).to eq('Harry')
      expect(clone.last_name).to eq('Hole')
      expect(clone.gender).to eq('male')
      expect(clone.address).to eq('Oslo')
    end
  end

  describe '#clone_with' do
    it 'builds new object' do
      contract = contract_class.new('Harry', 'Hole', 'male', 'Oslo')

      expect(contract).not_to be(contract.clone_with({}))
    end

    it 'overrides values in instance variables' do
      clone = contract_class
              .new('Harry', 'Hole', 'male', 'Oslo')
              .clone_with(first_name: 'John', last_name: 'Smith', gender: 'UFO', address: 'NY')

      expect(clone.first_name).to eq('John')
      expect(clone.last_name).to eq('Smith')
      expect(clone.gender).to eq('UFO')
      expect(clone.address).to eq('NY')
    end
  end
end
