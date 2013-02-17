#!/usr/bin/env ruby

require 'redcarpet'
require 'colored'

class Markout < Redcarpet::Render::Base
	def normal_text (text)
		text
	end

	def paragraph (text)
		" #{text}\n\n"
	end

	def header (title, level)
		case level
			when 1
				"#{title.bold.red}\n\n"
			when 2
				"#{title.bold.blue}\n\n"
			when 3
				"#{title.blue}\n"
		end
	end

	def emphasis (text)
		text.bold
	end

	def block_code (code, language)
		"#{normal_text(code).black_on_white}\n"
	end

	def codespan (code)
		code.black_on_white
	end
end

markdown = Redcarpet::Markdown.new(Markout, :fenced_code_blocks => true)
puts markdown.render(File.read(ARGV[0]))