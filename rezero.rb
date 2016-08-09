# rezeroコマンド
# -a:	URL追加
# -l:	URLリスト表示
# -r:	価格情報更新
# -d: URL削除
require 'sqlite3'
require 'open-uri'

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
		@db = SQLite3::Database.new 'rezero.db'

		# テーブルが存在しない場合にデフォルトのデータを作る
		result = @db.execute('select * from sqlite_master where type="table"')
		if result.empty?
			create_default_table()
		end
	end

	def add_url(url)
		
	end

	def preview()
	end

	def get_url_list()
	end

	def reload()
	end

	def delete_url(url)
	end

	private
	def create_default_table()
		sql = <<-SQL
		create table products (
			id integer primary key,
			url text not null,
			price integer,
			name text
		);
		SQL
		
		@db.execute(sql)
	end

	def url_exist(url)
		if !url.start_with?("http")
			return false
		end

		begin
			open(url)
		rescue
			return false
		else
			return true
		end
	end
end

