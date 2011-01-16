require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Avataree" do
  
  #tests for client googl
  describe "Helper" do
    before(:all) do
      @klass = Struct.new(:class)
      @klass.instance_eval { include Helper }
      @email = "test@test.com"
      @expected_digest = "b642b4217b34b1e8d3bd915fc65c4452"
      @hash = {:email => @email, :name => "testing"}
    end
    
    it "should make a proper md5 digest for given email" do
      digest = @klass.new.make_digest(@email)
      digest.should_not be_empty
      digest.should == @expected_digest
    end
    
    it "should be able to convert a hash into params" do
      Hash.new.should respond_to :to_param
      @hash.to_param.should == "name=testing&email=test@test.com"
    end
    
    it "should respond to (secure) url services" do
      Helper.should respond_to :url_services
      Helper.should respond_to :secure_url_services
    end
    
    it "should gives default (secure) url if not changed" do
      Helper.secure_url_services.should == "https://secure.gravatar.com/"
      Helper.url_services.should == "http://www.gravatar.com/"
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
    
    it "should respond to methods if included" do
      @klass.new.should respond_to :gravatar
      @klass.new.should respond_to :gravatar_image_path
    end
    
    it "should return a valid gravatar url provided email" do
      response = @klass.new.gravatar(@email)
      response.should == "http://www.gravatar.com/avatar/22bd03ace6f176bfe0c593650bcf45d8"
    end
    
    it "should return a valid gravatar url provided email and options" do
      response = @klass.new.gravatar(@email, @options)
      response.should == "#{Helper.url_services}avatar/22bd03ace6f176bfe0c593650bcf45d8.jpg?rating=g&size=100x100"
    end
    
    it "should return a secure url if given in options" do 
      response = @klass.new.gravatar(@email, @options.merge({:secure => true}))
      uri = URI.parse(response)
      uri.scheme.should == "https"
    end
    
    it "should return a normal url if secure option set to false" do 
      response = @klass.new.gravatar(@email, @options.merge({:secure => false}))
      uri = URI.parse(response)
      uri.scheme.should_not == "https"
      uri.scheme.should == "http"
    end
    
  end
  
end
