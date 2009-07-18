class Controller < Ramaze::Controller
  layout 'default'
  engine :Haml
end

require 'controller/main.rb'
