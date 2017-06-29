ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'


class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new_bookmark
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tag].split(" ").each do |pt|
      link.tags << Tag.first_or_create(name: pt)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:tag])
    @links = tag ? tag.links : []
    erb :links
  end

  # get '/users/new' do
  #   erb :users
  # end

end
