class Api::V1::MessagesController < ApplicationController
  before_action :method_name, :only => [:index]
  def index
    @messages = Message.all
  end

  def method_name
    request.format = 'json'  if request.format = 'text/html'
  end
end
