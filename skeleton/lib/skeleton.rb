require 'yaml'

class Skeleton

  def load(file)
    source = begin
      YAML.load_file('example.yml')
    rescue ArgumentError => e
      puts "YAML invalido: #{e.message}"
    end

    create source
  end

  def create(object)
    if is_directory? object
      object.each do |element|
        if is_container? element
          create_directory element[0]
          p "into directory #{element[0]}"
          if is_file_container? element[1]
            element[1].each do |element|
              if is_file? element
                create_file element
              elsif is_directory? element
                create element
              end
            end
          elsif is_empty_directory_container? element[1]
            p "empty directory element[0]"
          end
          p "out directory #{element[0]}"
        end
      end
    end
  end

  def create_file file_name
    p "creating file #{file}"
  end

  def create_directory directory
    p "creating directory #{directory}"
  end

  def discover_directory directory
    p "discovering directory #{directory.class}"
  end

  def have_files?
  end

  def have_directories?
  end

  def is_file? object
    #p "is file? #{object.class}"
    object.class == String
  end

  def is_directory? object
    #p "is directory? #{object.class}"
    object.class == Hash
  end

  def is_empty_directory_container? object
    #p "is empty directory #{object.class}"
    object.class == NilClass
  end

  def is_container? object
    #p "is container? #{object.class}"
    object.class == Array
  end

  def is_file_container? object
    #p "is file container? #{object.class}"
    (object.class == Array && object.count > 2)
  end

  def self.start args
    Skeleton.new.load args
  end
end

Skeleton.start 'lol'
