require 'rails_helper'

RSpec.describe "Renamed routes" do

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
