ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/link.rb'
require_relative 'models/tag.rb'


class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    erb :links
  end

  get '/links/new' do
    erb :new_bookmark
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    Tag.create(tag: params[:tag])
      redirect '/links'
  end
end
