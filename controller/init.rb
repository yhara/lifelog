class Controller < Ramaze::Controller
  layout 'default'
  engine :Gestalt
  helper :gestalt
end

require 'controller/main.rb'
