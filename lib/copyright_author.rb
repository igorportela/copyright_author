# Author - Igor | Copyright(c) 2012. All rights reserved.
require "copyright_author/version"

module AddCopyrightAuthor
  def self.process(options)

    # defaults
    name  = options[0] || "NO AUTHOR"
    directory = options[1] || Dir.pwd

    prefix = "Author - #{name} | Copyright(c) #{Time.now.year}. All rights reserved.\n"

	extensions = {
		'rb' => '# {text}',
		'rake' => '# {text}',
		'haml' => '-# {text}',
	}

	count = 0
	extensions.each do |ext, comment_style|
		rbfiles = File.join(directory ,'**', '*.'+ext)
		Dir.glob(rbfiles).each do |filename|
			file = File.new(filename, "r+")

			lines = file.readlines

			# remove current copyright comment(s)
			while lines[0] && (lines[0].starts_with?(comment_style.sub('{text}', ' copyright')))
				lines.shift
			end

			# set current copyright
			lines.insert(0,comment_style.sub('{text}', prefix))
			count += 1

			file.pos = 0
			file.puts(lines.join)
			file.close
		end
	end
    puts "Copyright set for #{count} source files"
  end
end

class String

  def starts_with?(s)
    self[0..s.length-1] == s
  end

end
