ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'


class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

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

  get '/users/new' do
    erb :users
  end

  post '/users/new' do
    user = User.create(email: params[:email], password: params[:password],
password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/links'
  end

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id])
    end
  end
end
