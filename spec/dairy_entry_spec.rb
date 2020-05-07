require 'diary_entry'
require 'spec_helper'

RSpec.describe DiaryEntry do
  describe '#create' do
    it 'allows us to create a new diary entry' do
      entry = DiaryEntry.new("entry", "date")
      persisted_data = PG.connect(dbname: 'diary_management_test').query("SELECT * FROM diary_entrys WHERE id = #{entry.id};")
      expect(entry).to eq "This is my first diary entry"
    end
  end
end
