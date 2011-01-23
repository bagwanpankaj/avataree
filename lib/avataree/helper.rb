# Copyright (c) 2010 [Bagwan Pankaj]
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# encoding: utf-8

require 'digest/md5'

module Avataree
  module Helper
  
    class << self
      attr_accessor :secure_url_services, :url_services 
    end
  
    def self.included(base)
      self.secure_url_services  = "https://secure.gravatar.com/"
      self.url_services         = "http://www.gravatar.com/"
      MonkeyPatches.activate!
    end
  
    #makes MD5 hash of given email
    def make_digest(email)
      Digest::MD5.hexdigest(email)
    end
  
    def self.url_for_request(ssl = false)
      ssl ? self.secure_url_services : self.url_services
    end
        
    def prepare_url_with_params(url, options)
      [url, get_params(options)].compact.join("?")
    end
    
    def get_params(options)
      options.to_param.presence
    end
  
    #fallback method if not defined(i.e if not used with rails)
    #to_param for hash if hash does not respond to it
    Hash.class_eval do
      def to_param
        self.collect{|k,v| "#{k}=#{v}"}.join("&")
      end unless Hash.respond_to?(:to_param)
    end
  
    module MonkeyPatches
    
      def self.activate!
        Hash.send(:include, MonkeyHash)
        Object.send(:include, MonkeyObject)
      end
    
      module MonkeyHash
      
        #monkey patch for hash
        def to_param
          self.collect{|k,v| "#{k}=#{v}"}.join("&")
        end unless Hash.respond_to?(:to_param)
    
      end
    
      module MonkeyObject
      
        def blank?
          instance_of? Array ? empty? : nil?
        end unless Object.respond_to?(:blank?)
      
        def present?
          !blank?
        end unless Object.respond_to?(:present?)
      
        def presence
          present? ? self : nil
        end unless Object.respond_to?(:presence)
      
      end
    end
  
  end
end