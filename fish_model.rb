def fish_list
  @fish.map do |fishie|
    "<li><a href='/" + fishie[:fish] + "'>" + fishie[:fish] + "</a></li>"
   end
end


