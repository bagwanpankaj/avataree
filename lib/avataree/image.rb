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

module Avataree
  
  module Image
    
    include Helper
    
    IMAGES_PATH = "http://www.gravatar.com/avatar/" unless const_defined?("IMAGES_PATH")
    
    def gravatar_image_path(email, options = {})
      email = make_digest(email)
      email<<".#{options[:extension]}" and options.delete(:extension) if options[:extension]
      params = options.to_param unless options.empty?
      resulted_path = IMAGES_PATH.dup << email
      [resulted_path, params].compact.join("?")
    end
    alias_method :gravatar, :gravatar_image_path
    
  end
  
end