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
      expect(digest).not_to be_empty
      expect(digest).to eq @expected_digest
    end

    it "#to_param" do
      expect(Hash.new).to respond_to :to_param
      expect(@hash.to_param).to include("email=test@test.com")
    end

    it "@secure_url_services and @url_services" do
      expect(Avataree::Helper).to respond_to :url_services
      expect(Avataree::Helper).to respond_to :secure_url_services
    end

    it "default @secure_url_services and @url_services" do
      expect(Avataree::Helper.secure_url_services).to eq "https://secure.gravatar.com/"
      expect(Avataree::Helper.url_services).to eq "http://www.gravatar.com/"
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
      expect(@klass.new).to respond_to :gravatar
      expect(@klass.new).to respond_to :gravatar_image_path
    end

    it "#gravatar" do
      response = @klass.new.gravatar(@email)
      expect(response).to eq "http://www.gravatar.com/avatar/22bd03ace6f176bfe0c593650bcf45d8?"
    end

    it "#include" do
      response = @klass.new.gravatar(@email, @options)
      expect(response).to include("size=100x100")
      expect(response).to include("rating=g")
    end

    it "#scheme" do
      response = @klass.new.gravatar(@email, @options.merge({:secure => true}))
      uri = URI.parse(response)
      expect(uri.scheme).to eq "https"
    end

    it "#scheme" do
      response = @klass.new.gravatar(@email, @options.merge({:secure => false}))
      uri = URI.parse(response)
      expect(uri.scheme).not_to eq "https"
      expect(uri.scheme).to eq "http"
    end

  end

end
