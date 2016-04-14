# Que pasa si el nombre del archivo es igual a el nombre de un asset?

class CodeInspector
	# string.include
	# string.chomp
	# string.index
	# string.gsub
	# string.grep
	# =~
	# matchdata
	# regex
	def inspect(assets, code_files)
		code_files.each do |file_path|
			#p file_path
			file = File.new(file_path)
			p file
			file_content = File.read(file_path)

			assets.each do |asset_path|
				asset = File.new asset_path
				asset_basename = File.basename(asset_path, '.json')
				if file_content.include?(asset_basename)
					p "#{file_path} contains: #{asset_basename}"
				end
			end
			File.open(file_path) do |file|
				p "#{file_path}: #{file}"
				file.each do |line|
					#p "#{file.lineno}: #{line}"
					assets.each do |asset_path|
						asset = File.new asset_path
						asset_basename = File.basename(asset_path, '.json')
						if line.include?(asset_basename)
							p "#{file.lineno}: #{line}"
						end
					end
				end

			end
		end

	end
end