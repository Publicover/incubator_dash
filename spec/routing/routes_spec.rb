require 'rails_helper'

RSpec.describe "Renamed routes" do

  # get 'login' => 'sessions#new'
  # post 'login' => 'sessions#create'
  # delete 'logout' => 'sessions#destroy'

  it "gets /login" do
    expect(:get => '/login').to route_to(:controller => "sessions", :action => "new")
  end

  it "posts /login" do
    expect(:post => '/login').to route_to(:controller => "sessions", :action => "create")
  end

  it "deletes /logout" do
    expect(:delete => '/logout').to route_to(:controller => "sessions", :action => "destroy")
  end

end
