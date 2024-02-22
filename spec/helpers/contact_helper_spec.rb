require 'rails_helper'

RSpec.describe ContactHelper do
  describe '#split_first_and_last_name' do
    it 'correctly splits a full name into first and last name' do
      full_name = 'John Doe Smith'
      expected_result = { first_name: 'John', last_name: 'Doe Smith' }
      expect(helper.split_first_and_last_name(full_name)).to eq(expected_result)
    end

    it 'handles single-word names correctly' do
      full_name = 'Cher'
      expected_result = { first_name: 'Cher', last_name: '' }
      expect(helper.split_first_and_last_name(full_name)).to eq(expected_result)
    end

    it 'handles an empty string correctly' do
      full_name = ''
      expected_result = { first_name: '', last_name: '' }
      expect(helper.split_first_and_last_name(full_name)).to eq(expected_result)
    end

    it 'handles multiple consecutive spaces correctly' do
      full_name = 'John    Doe Smith'
      expected_result = { first_name: 'John', last_name: 'Doe Smith' }
      expect(helper.split_first_and_last_name(full_name)).to eq(expected_result)
    end

    it 'returns nil for first and last name when input is nil' do
      full_name = nil
      expected_result = { first_name: nil, last_name: nil }
      expect(helper.split_first_and_last_name(full_name)).to eq(expected_result)
    end

    it 'handles names with special characters correctly' do
      full_name = 'John Doe-Smith'
      expected_result = { first_name: 'John', last_name: 'Doe-Smith' }
      expect(helper.split_first_and_last_name(full_name)).to eq(expected_result)
    end

    it 'handles non-Latin script names correctly' do
      full_name = '李 小龙'
      expected_result = { first_name: '李', last_name: '小龙' }
      expect(helper.split_first_and_last_name(full_name)).to eq(expected_result)
    end

    it 'handle name with trailing spaces correctly' do
      full_name = 'John Doe Smith '
      expected_result = { first_name: 'John', last_name: 'Doe Smith' }
      expect(helper.split_first_and_last_name(full_name)).to eq(expected_result)
    end

    it 'handle name with leading spaces correctly' do
      full_name = ' John Doe Smith'
      expected_result = { first_name: 'John', last_name: 'Doe Smith' }
      expect(helper.split_first_and_last_name(full_name)).to eq(expected_result)
    end

    it 'handle name with phone number correctly' do
      full_name = '+1234567890'
      expected_result = { first_name: '+1234567890', last_name: nil }
      expect(helper.split_first_and_last_name(full_name)).to eq(expected_result)
    end

    it 'handle name with mobile number with spaces correctly' do
      full_name = '+1 234 567 890'
      expected_result = { first_name: '+1 234 567 890', last_name: nil }
      expect(helper.split_first_and_last_name(full_name)).to eq(expected_result)
    end

    it 'correctly splits a full name with middle name' do
      full_name = 'John Quincy Adams'
      expected_result = { first_name: 'John', last_name: 'Quincy Adams' }
      expect(helper.split_first_and_last_name(full_name)).to eq(expected_result)
    end

    it 'handles names with multiple spaces between first and last name' do
      full_name = 'John    Quincy   Adams'
      expected_result = { first_name: 'John', last_name: 'Quincy Adams' }
      expect(helper.split_first_and_last_name(full_name)).to eq(expected_result)
    end

    it 'handles names with leading and trailing whitespaces' do
      full_name = '  John  Quincy  Adams  '
      expected_result = { first_name: 'John', last_name: 'Quincy Adams' }
      expect(helper.split_first_and_last_name(full_name)).to eq(expected_result)
    end

    it 'handles names with leading and trailing whitespaces and a middle initial' do
      full_name = '  John Q.  Adams  '
      expected_result = { first_name: 'John', last_name: 'Q. Adams' }
      expect(helper.split_first_and_last_name(full_name)).to eq(expected_result)
    end
  end
end
