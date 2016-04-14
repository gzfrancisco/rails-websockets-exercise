require 'find'

class AssetSpotlight
	
	def spotligth(filename, directory)
		#p 'spotligth: '+filename
		p directory
		p Dir.pwd
		#p Dir.chdir(directory)
		#p Dir.pwd
		Dir.foreach(directory) do |entry|
			p "#{directory+entry}: #{File.directory?(directory+entry)}"
			if not entry[0] == "."
				p 'not:'+entry
				
			end
			#p "#{File.directory?(entry)}"
			if File.directory?(directory+entry)
				
			else
				
			end
		end
	end
	
	def find_assets(file, directory)
		results = []
		Find.find(directory) do | path |
			#p "File: #{path}"
			if File.extname(path) == ".json"
				#p "json file: #{path}"
				results.push path
			end
		end
		results
	end
end