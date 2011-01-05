module Avataree
  
  class << self
    
    def enable!
      enable_for_controller!
      enable_for_views!
    end
    
    def enable_for_controller!
      #hook for ActionController
      ActionController::Base.send(:include, Avataree::ImageServices)
      ActionController::Base.send(:include, Avataree::ProfileServices)
    end
    
    def enable_for_views!
      #hook for ActionView
      ActionView::Base.send(:include, Avataree::ImageServices)
    end

  end
  
end