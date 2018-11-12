require "admiral"
require "uri"
require "file"

def removePrefix(str : String, prefix : String) : String
  return str.reverse.chomp(prefix.reverse).reverse
end

def addPrefix(str : String, prefix : String) : String
  return "#{prefix}#{str}"
end

def append(filename : String, str : String)
  if !File.exists? filename
    raise "Can't find #{filename} file."
  end

  content = File.read(filename)
  File.write(filename, "#{content}\n#{str}")
end

def blockFmt(url : String) : String
  return "0.0.0.0 #{url}"
end

module Block
  class Cli < Admiral::Command
    define_argument url : String
    define_version "1.0.0"
    define_help description: "Block websites via the /etc/hosts file."

    def run
      if arguments.url.nil?
        puts help
        return
      end

      url = removePrefix arguments.url.to_s, "www."
      wwwUrl = "www.#{url}"

      begin
        append("/etc/hosts", "#{blockFmt url}\n#{blockFmt wwwUrl}")
      rescue e : Errno
        puts e.message
        puts "You may need to use 'sudo block <website>'"
      rescue e : Exception
        puts e.message
      end
    end
  end
end

Block::Cli.run
