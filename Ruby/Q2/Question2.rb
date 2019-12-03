class Listing

  def initialize(line)

    # I remove the features from the line first so that I can split up the
    # rest of the line without splitting up the features
    remove_features = line.split('{')
    features = remove_features[1].split('}')
    @features = "{" + features[0] + "}"
    if(remove_features[0] == nil)
      attributes = features[1]
    elsif (features[1] == nil)
      attributes = remove_features[0]
    else
      attributes = remove_features[0] + features[1]
    end

    # Splitting the attributes with a comma separator, because that is the convention for
    # each attribute in a line. afterwards, I match every attribute to an attribute in
    # the listing class
    attributes = attributes.split(',')
    attributes.each do |attribute|
      if match_category(attribute)
        @category = attribute.gsub ' ', ''
      elsif match_battery_life(attribute)
        @batterylife = attribute.gsub ' ', ''
      elsif match_color(attribute)
        @color = attribute.gsub ' ', ''
      elsif match_manufacturer(attribute)
        @manufacturer = attribute.gsub ' ', ''
      elsif match_status(attribute)
        @status = attribute.gsub ' ', ''
      elsif match_year_built(attribute)
        @year_built = attribute.gsub ' ', ''
      elsif match_price(attribute)
        @price = attribute.gsub ' ', ''
      elsif @model_number == nil # When I split, the final element in the array is "" and we don't want to assign that
        @model_number = attribute.gsub ' ', ''
      end
    end
  end

  def match_category(attr)
    if attr.upcase =~ /SMARTPHONE/ || attr.upcase =~ /TABLET/ || attr.upcase =~ /LAPTOP/ || attr.upcase =~ /SMARTWATCH/
      true
    else
      false
    end
  end

  def match_battery_life(attr)
    if attr.upcase =~ /HRS/
      true
    else
      false
    end
  end

  def match_color(attr)
    if attr.upcase =~ /SILVER|WHITE|BLACK|BURGUNDY|BLUE/
      true
    else
      false
    end
  end

  def match_manufacturer(attr)
    if attr.upcase =~ /APPLE|SAMSUNG|GOOGLE|LENOVO|LG/
      true
    else
      false
    end
  end

  def match_status(attr)
    if attr.upcase =~ /USED|NEW|REFURBISHED/
      true
    else
      false
    end
  end

  def match_year_built(attr)
    attr = attr.gsub ' ', ''
    if attr.length == 4 && attr =~ /^[0-9]+$/
      true
    else
      false
    end
  end

  def match_price(attr)
    if attr =~ /\$/
      true
    else
      false
    end
  end

  def match_features(attr)
    if attr =~ /\{/
      true
    else
      false
    end
  end

  def match_model_number(attr)
    if attr =~ /^[a-zA-Z0-9]*/
      true
    else
      false
    end
  end

  def get_manufacturer
    return @manufacturer
  end

  def get_category
    return @category
  end

  def get_model_number
    return @model_number
  end

  # The following formats the attributes as specified in the table
  def formatAttributes
    @status = @status.downcase
    @batterylife = @batterylife.downcase
    @category = @category[0].upcase + @category[1, @category.length - 1].downcase
    @color = @color.downcase
    @status = @status.downcase
    if @manufacturer =~ /LG|lg|Lg|lG/
      @manufacturer = @manufacturer.upcase
    else
      @manufacturer = @manufacturer[0].upcase + @manufacturer[1, @manufacturer.length - 1].downcase
    end
  end

  # returns a listing as a string in the right order for export and separated by commas followed
  # by a space
  def to_string
    @category + ", " + @batterylife + ", " + @model_number + ", " + @color + ", " + @manufacturer + ", " + \
      @status + ", " + @year_built + ", " + @price + ", " + @features
  end
end

class Catalogue
  def initialize
    @inventory = []
  end

  def addToInventory(line) # add a listing to the inventory
    @inventory << Listing.new(line)
  end

  def importListing(file) # import a file and add the listings to the inventory
    File.open(file).each do |line|
      addToInventory(line)
    end
  end

  def sortCatalogue # Sorts the listings in the catalogue for export
    @inventory = @inventory.sort_by{|aListing| [aListing.get_manufacturer, aListing.get_category, aListing.get_model_number]}
  end

  def exportListing(file) # Exports the inventory of listings to a file
    sortCatalogue
    file = File.open(file, "w")
    @inventory.each do |aListing|
      aListing.formatAttributes
      file.puts aListing.to_string
    end
    file.close
  end

  def print_catalogue # Print catalogue
    @inventory.each do |aListing|
      puts aListing.to_string
    end
  end

end


#Beginning of main code
a_catalogue = Catalogue.new

the_exit = false # For exiting the loop

until the_exit
  # display the menu
  puts "Please enter the number of the option you would like to do."
  puts "1. show the inventory\n2. import a listing\n3. export to listing\n4. exit."
  input = gets.chomp # get input from the user
  if input =~ /1/
    a_catalogue.print_catalogue
  elsif input =~ /2/
    puts "Please enter a file:"
    input_file = gets.chomp
    a_catalogue.importListing(input_file)
  elsif input =~ /3/
    puts "Please enter the name of the file you want to export your listing to:"
    input_file = gets.chomp
    a_catalogue.exportListing(input_file)
  elsif input =~ /4/
    puts "Exiting now!"
    the_exit = true
  else
    puts "Sorry, I didn't get what you wanted to do ..."
  end
end

