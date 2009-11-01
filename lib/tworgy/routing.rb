module ActionController
  module Routing
    class RouteSet
      class Mapper
        def controller_actions(controller, actions)
          actions.each do |action| 
            cname = controller.gsub(/\//, "_")
            self.send("#{cname}_#{action}", "#{controller}/#{action}", :controller => controller, :action => action)
          end
        end
      end
    end
  end
end