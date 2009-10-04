module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in webrat_steps.rb
  #
  def path_to(page_name)
    case page_name
 
    when /google/                  # poderia ser minha_app
      'http://www.google.com'      # e http://localhost:8080/minha_app
    else
      page_name
      
      #FIXME to ignore navigation mapping
      #raise "Can't find mapping from \"#{page_name}\" to a path.\n Now, go and add a mapping in #{__FILE__}"
    end
  end
end
 
World(NavigationHelpers)
