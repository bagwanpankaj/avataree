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

require 'json'
require 'open-uri'

module Avataree
  
  module ProfileServices
    
    #image path for gravatar if not defined? 
    # PROFILE_PATH = "http://www.gravatar.com/" unless const_defined?("PROFILE_PATH")
    
    # this method returns hash full of information provided by Gravatar.
    # This hash may contain
    # Email address marked up with class=email (only available via JS/client-side parsing due to spam-protection measures)
    # IM accounts (some values only available via JS/client-side parsing due to spam-protection measures)
    # Phone numbers
    # Verified accounts 
    # Name 
    # Personal Links
    # Image (main Gravatar) 
    def gravatar_profile(email, options = {})
      services_url = (options[:secure] ? Helper.secure_url_services : Helper.url_services) and options.delete(:secure)
      email = make_digest(email)
      email << ".json"
      params = options.to_param unless options.empty?
      resulted_path = [services_url, email].join
      path = [resulted_path, params].compact.join("?")
      begin
        JSON.parse(open(path).read)
      rescue => e
        {"error" => "unable to parse", "description" => "either no such user is found on gravatar using
           provided email or some server side error. do check it out.", "errorTrace" => "#{e}"}
      end
    end
    
  end
  
end