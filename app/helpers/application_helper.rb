module ApplicationHelper
  def translation(messages)
    jp_messages = []
    price_message = ""
    messages.each do |message|
      case message

      when "Item name can't be blank"
        message = "商品名を入力してください"      
      when "Item text can't be blank"
        message = "商品の説明を入力してください"
      when "Price can't be blank"
        price_message = "販売価格を入力してください"
        next
      when "Price is not included in the list"
        if price_message == "販売価格を入力してください"
          next
        end
        price_message = "販売価格は300円〜9,999,999円までです"
        next
      when "Price is invalid"
        if price_message == "販売価格を入力してください"
          next
        end
        price_message = "販売価格は半角数字のみで入力してください"
        next
      when "Price is not a number" 
        if price_message == "販売価格を入力してください"
          next
        end
        price_message = "販売価格は半角数字のみで入力してください"
        next        
      when "Image can't be blank"
        message = "出品画像を選択してください"
        jp_messages.insert(0,message)
        next
      when "Category must be other than 1"
        message = "カテゴリーを選択してください"
      when "Condition must be other than 1"
        message = "商品の状態を選択してください"
      when "Who cost must be other than 1"
        message = "配送料の負担を選択してください"
      when "Shipping area must be other than 1"
        message = "発送元の地域を選択してください"
      when "Days to ship must be other than 1"
        message = "発送までの日数を選択してください"

      when "Email can't be blank"
        message = "メールアドレスを入力してください"
      when "Email has already been taken"
        message = "そのメールアドレスは既に使われています"
      when "Password can't be blank"
        message = "パスワードを入力してください"
      when "Password is invalid"
        if jp_messages.include?("パスワードを入力してください")
          next
        end
        message = "パスワードは半角のみ、英数含めて設定してください"
      when "Password confirmation doesn't match Password"
        message = "パスワードは確認用含めて2回入力してください"
      when "Password is too short (minimum is 6 characters)"
        message= "パスワードは６文字以上で設定してください"
      when "Nickname can't be blank"
        message = "ニックネームを入力してください"
        jp_messages.insert(0,message)
        next
      when "Last name can't be blank"
        message = "お名前を入力してください"
      when "Last name is invalid"
        message = "お名前は全角で入力してください"
      when "First name can't be blank"
        message = "お名前を入力してください"
      when "First name is invalid"
        message = "お名前は全角で入力してください"
      when "Ruby last name can't be blank"
        message = "お名前（カナ）を入力してください"
      when "Ruby last name is invalid"
        message = "お名前（カナ）は全角カタカナで入力してください"
      when "Ruby first name can't be blank"
        message = "お名前（カナ）を入力してください"
      when "Ruby first name is invalid"
        message = "お名前（カナ）は全角カタカナで入力してください"
      when "Birthday can't be blank"
        message = "誕生日を入力してください"
      end
      jp_messages << message
    end 

    if price_message.present?
      jp_messages << price_message
    end
    
    return jp_messages.uniq
  end

  
  def translation_sessions(message)
    return message = "メールアドレスとパスワードを入力してください"
  end
end
