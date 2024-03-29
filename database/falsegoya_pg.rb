require 'cgi'
cgi = CGI.new


# PG::connect(dbname: "goya")により、rubyからgoyaDBに接続し
# 接続したという情報をconnectionという名前の変数に格納する
connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"
begin
  # connection変数を使いPostgreSQLを操作する
  # .execで、goyaDBに"select date, weight, give_for from crops;"
  # のSQLの命令文を直接実行し、その結果をresult変数に格納する
  fals = connection.exec("select * from crops where not (quality = true);")

  # 取り出した各行を処理する
  fals.each do |rotten|
      # 各行を取り出し、putsでターミナル上に出力する
      puts "品質が悪いもの：#{rotten}
  end
ensure
  # 何かしらのエラーが発生した場合、
  # .finishでデータベースへのコネクションを切断する
  connection.finish
end
