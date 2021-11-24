require 'rails_helper'

RSpec.describe Service, type: :model do
  subject do
    described_class.new(name: 'Sample 1 service',
                        description: 'Sample 1 Service description',
                        price: 4,
                        image_url: 'https://drive.google.com/file/d/1346McxIF6VhUSCBim7NjxWwU_N-GNkl4/view?usp=sharing')
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a name of "abc"' do
      subject.name = 'abc'
      expect(subject).to_not be_valid
    end

    it 'is not valid without a description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a price' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an image url' do
      subject.image_url = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a wrongly formatted url' do
      subject.image_url = 'amazing sljsjljs'
      expect(subject).to_not be_valid
    end
  end
end
