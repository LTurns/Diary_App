require 'pg'

class DiaryEntry
  attr_reader :id, :entry, :date

  def initialize(id:, entry:, date:)
    @id = id
    @entry = entry
    @date = date
  end

  def self.all
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'test_diary_management')
    else
    connection = PG.connect(dbname: 'diary_management')
   end
    result = connection.exec("SELECT * FROM diary_entries")
    result.map do |entry|
      DiaryEntry.new(id: entry['id'], entry: entry['entry'], date: entry['date'])
    end
  end

  def self.create(entry:, date:)
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'test_diary_management')
    else
      connection = PG.connect(dbname: 'diary_management')
    end
    result = connection.exec("INSERT INTO diary_entries (entry, date) VALUES('#{entry}', '#{date}') RETURNING id, entry, date;")
    DiaryEntry.new(id: result[0]['id'], entry: result[0]['entry'], date: result[0]['date'])
  end
end
