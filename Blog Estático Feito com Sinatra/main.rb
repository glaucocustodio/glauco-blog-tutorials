# encoding: UTF-8
require 'sinatra'
require 'find'

def get_files(path)
  files = []
  Find.find(path) do |c|
    files << File.basename(c, ".erb") if !File.directory?(c)
  end
  return files
end

get '/' do
  @posts = get_files('./views/posts/')
  erb :index
end

get '/visualizar/:post/?' do
  halt 404 unless File.exist?("views/posts/#{params[:post]}.erb")
  erb :"posts/#{params[:post]}"
end

get '/sobre-o-autor/?' do
  erb :author
end

not_found do
  erb :"404"
end
