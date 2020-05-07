require 'sinatra/base'
require './lib/diary_entry.rb'

class Diary < Sinatra::Base

  get '/' do
    erb :new
  end

  get '/new_entry'

  post '/entries' do
    DiaryEntry.create(entry: params[:entry], date: params[:date])
    redirect '/entries'
  end

  get '/entries' do
    erb :entries_list
    redirect '/'
  end

end
