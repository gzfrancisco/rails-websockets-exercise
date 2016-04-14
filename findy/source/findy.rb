require "./asset_spotlight"
require "./code_spotlight"
require "./code_inspector"
#require_relative 'asset_spotlight'

p 'findy is now starting'
=begin
p ARGV
p ARGF.readlines
#p ARGF.read
#p ARGF.filename
#p ARGF.file
#p ARGF.path
#p ARGF.methods
#ARGV.each do|a|
#  puts "Argument: #{a}"
end
=end

class Findy
	@asset_spotlight
	@code_spotlight
	@research_report
	#def start(withFilename:filename, andProjectDirectory:aDirectory)
		#p withFilename
		#p filename
	#end

	def start(filename, directory)
		@asset_spotlight = AssetSpotlight.new
		@code_spotlight = CodeSpotlight.new
		@code_inspector = CodeInspector.new
		asset_files = @asset_spotlight.find_assets(filename, directory)
		p "assets: #{asset_files}"
		code_files = @code_spotlight.find_code(directory)
		p "code: #{code_files}"
		@code_inspector.inspect(asset_files, code_files)
	end
end




findy = Findy.new
#findy.start(withFilename:'data.json', andProjectDirectory:'/Users/gzfrancisco/Desktop/findy/')
findy.start('data.json', '/Users/gzfrancisco/Desktop/findy/source/')