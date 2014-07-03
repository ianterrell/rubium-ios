module UIAutomation
  module ElementProxyMethods
    # Returns a new proxy object to a UIAElementArray. function_name must correspond to
    # a function on the currently proxied object that returns an UIAElementArray as 
    # defined by the Javascript API documentation.
    #
    # By default, the returned object will use UIAutomation::Element when creating
    # proxies to any elements within its collection - pass a different UIAutomation::Element
    # sub-class in as a second parameter if you want to use a specific type.
    #
    def element_array_proxy_for(function_name, element_klass = UIAutomation::Element)
      proxy_for(function_name, 
        proxy_klass: UIAutomation::ElementArray, 
        proxy_args: [element_klass, self, window]
      )
    end

    # Similar to proxy_for() but returns an instance UIAutomation::Element by default.
    #
    # A specific UIAutomation::Element sub-class can be passed in as an optional second
    # parameter.
    #
    def element_proxy_for(function_name, klass = UIAutomation::Element)
      raise TypeError.new("Element type #{klass} is not a sub-class of UIAutomation::Element") unless (klass <= UIAutomation::Element)
      
      proxy_for(function_name, 
        proxy_klass: klass, 
        proxy_args: [self, window]
      )
    end
  end
  
  class RemoteProxy
    include ElementProxyMethods
  end
end
