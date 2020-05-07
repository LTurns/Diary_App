require 'sinatra/base'
require './lib/diary_entry.rb'

class Diary < Sinatra::Base

  get '/' do
    @entries = DiaryEntry.all
    erb :entries_list
  end

  get '/new_entry' do
    erb :new
  end

  post '/entries' do
    DiaryEntry.create(entry: params[:entry], date: params[:date])
    redirect '/'
  end

  run! if app_file == $0

end
