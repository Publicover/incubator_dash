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

  it "gets /change_avatar" do
    expect(:get => '/students/:id/change_avatar').to route_to(:controller => "students", :action => "change_avatar", :id =>":id")
  end

end
