module Avataree
  
  class << self
    
    def enable!
      enable_for_controller!
      enable_for_views!
    end
    
    def enable_for_controller!
      #hook for ActionController
      ActionController::Base.send(:include, Avataree::Image)
      ActionController::Base.send(:include, Avataree::Profile)
    end
    
    def enable_for_views!
      #hook for ActionView
      ActionView::Base.send(:include, Avataree::Image)
    end

  end
  
end