require 'fileutils'

playlist = ARGV[0]
directory = ARGV[1]

puts "Reading #{playlist}" if File.readable? playlist

File.open(playlist, 'r') do |file|
  file.each_line do |line|
    position = 0
    line.split("\r").each do |lines|
      path = lines unless lines.include? '#EXT'
      unless path.nil?
        basename = File.basename path unless path.nil?
        position = position + 1
        position_lead_zero = format("%02d", position)
        p "#{path} > #{position_lead_zero} #{basename}"

        unless Dir.exist? "#{Dir.pwd}/#{directory}"
          p 'The directory isn\'t exist'

          Dir.mkdir "#{Dir.pwd}/#{directory}"
        end

        FileUtils.cp_r(path,"#{Dir.pwd}/#{directory}/#{position_lead_zero} #{basename}") if File.exist? path
      end
    end
  end
end
