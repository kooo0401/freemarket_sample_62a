crumb :root do
  link "メルカリ", root_path
end

crumb :user_show do
  link "マイページ", user_path
end

crumb :user_profile_edit do
  link "プロフィール", profile_edit_user_path
  parent :user_show
end

crumb :user_credit_edit do
  link "支払い方法", credit_edit_user_path
  parent :user_show
end

crumb :user_confirmation_edit do
  link "本人情報の登録", confirmation_edit_user_path
  parent :user_show
end

# crumb :user_myaddress_edit do
#   link "発送元・お届け先住所変更", myaddress_edit_user_path
#   parent :user_show
# end

# crumb :user_mail_pass_edit do
#   link "メール/パスワード", mail_pass_edit_user_path
#   parent :user_show
# end

# crumb :user_tel_edit do
#   link "本人情報の登録", tel_edit_user_path
#   parent :user_show
# end