
require 'csv'

class Gossip

 attr_reader :content, :author

  def initialize(author, content)
    @content = content
    @author = author
  end

	def save
		CSV.open("db/gossip.csv", "ab") do |csv| #"ab" en mode écriture
			csv << [@author,@content]
		end
	end

	def self.all
		all_gossips = []
		CSV.read("db/gossip.csv").each  do |csv_line| # chercher chacune des lignes du csv		
				all_gossips <<  Gossip.new(csv_line[0],csv_line[1]) 			
		end
		return all_gossips
	end

	def find(id)
		 id = id.to_i
		 tabe_csv = CSV.read("db/gossip.csv")
		 return tabe_csv[id]	
	end
  

end