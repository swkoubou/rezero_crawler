# rezeroコマンド
# -a:	URL追加
# -l:	URLリスト表示
# -r:	価格情報更新
# -d: URL削除
require 'sqlite3'
require 'open-uri'


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
		if url_exist(url)
			@db.execute("insert into products (url) values (?)", url)
		end
	end

	def preview()
		@db.execute("select url, name, price from products") do |row|
			puts "#{row[1]}: #{row[2]}円"
		end
	end

	def get_url_list()
		@db.execute("select id, name, url from products") do |row|
			puts "#{row[0]}: #{row[1]}: #{row[2]}"
		end
	end

	def reload()
	end

	def delete(id)
		@db.execute("delete from products where id=#{id}")
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
			#open(url)	# amazonにアクセスが弾かれてるから消した
		rescue
			return false
		else
			return true
		end
	end
end

# コマンドライン引数をパースして動作を変える
help = <<-HELP
USAGE: rezero.rb [OPTION] [STRING]

OPTIONS:
 -a:	URL追加
			rezero.rb -a "[URL]"
 -l:	URLリスト表示
 -r:	価格情報更新
 -d:	URL削除
			rezero.rb -d "[ID]"
HELP

re = ReZero.new
if ARGV.size == 0
	re.preview()
elsif ARGV[0] == '-a'
	if ARGV[1].nil?
		puts "Need [URL]"
		puts "See 'rezero --help'"
	else
		re.add_url(ARGV[1])
	end
elsif ARGV[0] == '-l'
	re.get_url_list()
elsif ARGV[0] == '-r'
	puts "This function will be comming soon :)"
elsif ARGV[0] == '-d'
	if ARGV[1].nil?
		puts "Need [ID]"
		puts "See 'rezero --help'"
	else
		re.delete(ARGV[1].to_i)
	end
elsif ARGV[0] == '--help'
	puts help
else
	puts "This option is invalid."
	puts "See 'rezero --help'"
end
