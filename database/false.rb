require 'cgi'
cgi = CGI.new

# データを受け取った後、HTMLの形式でレスポンスを返す
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # 情報の目印とした"goya"のデータを cgi['goya']と言う記述で取り出し、ローカル変数に代入する
  get = cgi['false']

  # HTMLでレスポンスを返却する
  "<html>
    <body>
      <p>品質が悪いもの</p>
      文字列：#{get}
    </body>
  </html>"
}


require 'cgi'
cgi = CGI.new
