require 'diary_entry'
require 'spec_helper'

RSpec.describe DiaryEntry do
  describe '#create' do
    it 'allows us to create a new diary entry' do
      entry = DiaryEntry.create(entry: "This is an entry", date: "date")
      persisted_data = PG.connect(dbname: 'test_diary_management').query("SELECT * FROM diary_entries WHERE id = #{entry.id};")
      expect(entry.entry).to eq "This is an entry"
    end
  end

  describe '#all' do
    it 'shows us the diary entries' do
      connection = PG.connect(dbname: 'test_diary_management')
      entry = DiaryEntry.create(entry: "My first diary entry", date: "date")
      entries = DiaryEntry.all
      expect(entries.first.entry).to eq "My first diary entry"
    end
  end
end
