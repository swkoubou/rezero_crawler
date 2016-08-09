# rezeroコマンド
# -a:	URL追加
# -l:	URLリスト表示
# -r:	価格情報更新
# -d: URL削除
require 'sqlite3'

# コマンドライン引数をパースして動作を変える
if ARGV.size == 0
	puts "This function will be comming soon :)"
elsif ARGV[0] == '-a'
	puts "This function will be comming soon :)"
elsif ARGV[0] == '-l'
	puts "This function will be comming soon :)"
elsif ARGV[0] == '-r'
	puts "This function will be comming soon :)"
elsif ARGV[0] == '-d'
	puts "This function will be comming soon :)"
elsif ARGV[0] == '--help'
	puts "This function will be comming soon :)"
else
	puts "This option is invalid."
	puts "See 'rezero --help'"
end

class ReZero
	def initialize()
		db = SQLite3::Database.new 'rezer.db'
	end

	def add_url()
	end

	def preview()
	end

	def get_url_list()
	end

	def reload()
	end

	def delete_url(url)
	end
end

