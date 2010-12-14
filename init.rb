# Include hook code here
require 'avataree'

#hook for ActionController
ActionController::Base.send(:include, Avataree::Image)
ActionController::Base.send(:include, Avataree::Profile)
#hook for ActionView
ActionView::Base.send(:include, Avataree::Image)