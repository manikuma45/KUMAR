class Player
  def hand
    while true
      puts "[0]グー\n[1]チョキ\n[2]パー"
      player_hand = gets.chomp
      if player_hand =~ /^[0-2]$/

         return player_hand


        else
          puts "数字を入力してください"
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
      end
    end  
  end
end

class Enemy
  def hand
    enemy_hand = rand(3)
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する  
  end
end

class Janken
   def pon(player, enemy)

      while true
         player_hand = player.hand.to_i
        enemy_hand = enemy.hand

    jankens = ["グー", "チョキ", "パー"]
    puts "あなたの手は#{jankens[player_hand]}, 相手の手は#{jankens[enemy_hand]}"


    if player_hand == enemy_hand

      puts "あいこで"


    elsif (player_hand == 0 && enemy_hand == 1) ||
          (player_hand == 1 && enemy_hand == 2) ||
          (player_hand == 2 && enemy_hand == 0)
      puts "あなたの勝ちです"
      
      break



    else

      puts "あなたの負けです"
      
      break

    end
  end
end
end


      # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
      # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
      # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
 

player = Player.new
enemy = Enemy.new
janken = Janken.new



# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player, enemy)


# ここに書かれているRubyの記述はあくまでヒントとして用意された雛形なので、書かれている記述に従わずに実装したいという場合は、自分の好きに実装して構わない。課題要件を満たし、コードの品質が一定の水準にあると判定されればどのような実装でも合格になる。