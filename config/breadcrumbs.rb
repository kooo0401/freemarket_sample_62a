crumb :root do
  link "メルカリ", root_path
end

crumb :user_show do
  link "マイページ", user_path
end

crumb :user_profile do
  link "プロフィール", profile_user_path
  parent :user_show
end

crumb :user_credit_edit do
  link "支払い方法", credit_edit_user_path
  parent :user_show
end

crumb :user_confirmation do
  link "本人情報の登録", confirmation_user_path
  parent :user_show
end

crumb :user_myaddress do
  link "発送元・お届け先住所変更", myaddress_user_path
  parent :user_show
end

crumb :user_mail_pass do
  link "メール/パスワード", mail_pass_user_path
  parent :user_show
end

crumb :user_tel do
  link "電話番号の確認", tel_user_path
  parent :user_show
end

crumb :user_logout do
  link "ログアウト", logout_user_path
  parent :user_show
end