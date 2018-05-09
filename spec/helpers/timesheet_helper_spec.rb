require 'spec_helper'

RSpec.describe TimesheetsHelper, type: :helper do
  describe '#shifts_by_date' do
    it 'sorts and separates the shifts by date' do
      shift = create :shift
      create :shift
      create :shift, start_time: Time.now + 1.day, end_time: Time.now + 1.day
      shifts = shifts_by_date(Shift.all)

      expect(shifts[Date.today]).to include(shift)
      expect(shifts.keys.size).to be(2)
      expect(shifts[Date.today].size).to be(2)
    end
  end
end