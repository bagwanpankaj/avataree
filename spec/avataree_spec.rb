require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Avataree" do
  
  #tests for client googl
  describe "Helper" do
    before(:all) do
      @klass = Struct.new(:class)
      @klass.instance_eval { include Avataree::Helper }
      @email = "test@test.com"
      @expected_digest = "b642b4217b34b1e8d3bd915fc65c4452"
      @hash = {:email => @email, :name => "testing"}
    end
    
    it ".make_digest" do
      digest = @klass.new.make_digest(@email)
      digest.should_not be_empty
      digest.should == @expected_digest
    end
    
    it "#to_param" do
      Hash.new.should respond_to :to_param
      @hash.to_param.should include("email=test@test.com")
    end
    
    it "@secure_url_services and @url_services" do
      Avataree::Helper.should respond_to :url_services
      Avataree::Helper.should respond_to :secure_url_services
    end
    
    it "default @secure_url_services and @url_services" do
      Avataree::Helper.secure_url_services.should == "https://secure.gravatar.com/"
      Avataree::Helper.url_services.should == "http://www.gravatar.com/"
    end
    
    # it "should allow to change (secure)urls" do
    #   Helper.url_services = "http://google.com"
    #   Helper.secure_url_services = "https://google.com"
    #   Helper.secure_url_services.should == "https://google.com"
    #   Helper.url_services.should == "http://google.com"
    # end
  end
  
  describe "Image Services" do
    
    before(:all) do 
      @email = "beau@automattic.com"
      @klass = Struct.new(:class)
      @klass.instance_eval{ include Avataree::ImageServices }
      @options = {:extension => "jpg", :size => "100x100", :rating => "g"}
    end
    
    it "#respond_to" do
      @klass.new.should respond_to :gravatar
      @klass.new.should respond_to :gravatar_image_path
    end
    
    it "#gravatar" do
      response = @klass.new.gravatar(@email)
      response.should == "http://www.gravatar.com/avatar/22bd03ace6f176bfe0c593650bcf45d8?"
    end
    
    it "#include" do
      response = @klass.new.gravatar(@email, @options)
      response.should include("size=100x100")
      response.should include("rating=g")
    end
    
    it "#scheme" do 
      response = @klass.new.gravatar(@email, @options.merge({:secure => true}))
      uri = URI.parse(response)
      uri.scheme.should == "https"
    end
    
    it "#scheme" do 
      response = @klass.new.gravatar(@email, @options.merge({:secure => false}))
      uri = URI.parse(response)
      uri.scheme.should_not == "https"
      uri.scheme.should == "http"
    end
    
  end
  
end
