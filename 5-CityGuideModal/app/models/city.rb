class City
  ATTRIBUTES = [:name, :description, :picture]

  ATTRIBUTES.each do |attribute|
    attr_accessor attribute
  end

  def initialize(hash={})
  	ATTRIBUTES.each do |a|
  		self.send("#{a}=", hash[a]) if hash[a]
  	end
  end

  def self.build_test_data
    [
      City.
        new(:name => 'London',
             :description => 'The capital of the United Kingdom and England.',
             :picture => UIImage.imageNamed('London.jpg')),

      City.
        new(:name => 'San Francisco',
             :description => 'The heart of the San Francisco Bay Area.',
             :picture => UIImage.imageNamed('SanFrancisco.jpg')),

      City.
        new(:name => 'Sydney',
             :description => 'The largest city in Australia.',
             :picture => UIImage.imageNamed('Sydney.jpg')),

      City.
        new(:name => 'Madrid',
             :description => 'The capital and largest city of Spain.',
             :picture => UIImage.imageNamed('Madrid.jpg'))
    ]
  end
end
