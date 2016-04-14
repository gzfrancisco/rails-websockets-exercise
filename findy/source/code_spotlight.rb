class CodeSpotlight
	def find_code(directory)
		results = []
		Find.find(directory) do | path |
			if File.extname(path) == ".m"
				results.push path
			end
		end
		results
	end
end