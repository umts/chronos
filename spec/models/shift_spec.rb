require 'spec_helper'

RSpec.describe Shift, type: :model do
  context 'with invalid params' do
    it 'rejects when end_date is before start_date' do
      shift = build(:shift, end_time: Time.now-4.hours)
      expect(shift.valid?).to be(false)

    end
  end
  describe 'length' do
    it 'returns the duration of the shift' do
      shift = create(:shift, start_time: Time.now, end_time: Time.now+4.25.hours)
      expect(shift.length).to eq(4.25)
    end
    it 'rounds up correctly' do
      shift = create(:shift, start_time: Time.now, end_time: Time.now+4.hours+27.minutes)
      expect(shift.length).to eq(4.5)
    end
    it 'rounds down correctly' do
      shift = create(:shift, start_time: Time.now, end_time: Time.now+4.hours+48.minutes)
      expect(shift.length).to eq(4.75)
    end
  end
  describe 'total' do
    it 'deducts lunch when duration > 6 hours' do
      shift1 = create(:shift, start_time: Time.now, end_time: Time.now+6.25.hours)
      shift2 = create(:shift, start_time: Time.now, end_time: Time.now+8.hours)

      expect(shift1.total).to eq(6)
      expect(shift2.total).to eq(7.5)
    end
    it 'returns duration when < 6 hours' do
      shift1 = create(:shift)
      shift2 = create(:shift, start_time: Time.now, end_time: Time.now+6.hours)

      expect(shift1.total).to eq(shift1.length)
      expect(shift2.total).to eq(6)
    end
  end
  describe 'lunch' do
    it 'correctly calculates lunchtime when duration > 6 hours' do
      shift1 = create(:shift, start_time: Time.now, end_time: Time.now+6.25.hours)
      shift2 = create(:shift, start_time: Time.now, end_time: Time.now+8.hours)

      expect(shift1.lunch).to eq(0.25)
      expect(shift2.lunch).to eq(0.5)
    end
    it 'returns 0 when duration < 6 hours' do
      shift1 = create(:shift)
      shift2 = create(:shift, start_time: Time.now, end_time: Time.now+6.hours)

      expect(shift1.lunch).to be(0)
      expect(shift2.lunch).to be(0)
    end
  end
end