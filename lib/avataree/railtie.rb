# encoding: utf-8

require 'avataree'
require 'avataree/helper'
require 'avataree/image'
require 'avataree/profile'
require 'avataree/switch'

module Avataree
  class Railtie < Rails::Railtie
    initializer 'avataree.initialize', :after => :after_initialize do
      Avataree.enable!
    end
  end
end