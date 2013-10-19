
def call
  html = File.read('something.erb')
  template  = ERB.new(html)

  result #this goes in the template = do something dynamic

  [200, {request stuff}, [template.binding(result)]]
end


##### the erb file

<% result.each do |a_thing| %>
  <%= a_thing %>
<% end %>