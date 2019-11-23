# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
# 下記に追加したjsファイルを記載要(2019/11/21 堀)
Rails.application.config.assets.precompile += %w( signup.js )
Rails.application.config.assets.precompile += %w( user.js )
Rails.application.config.assets.precompile += %w( owl-carousel.js )
Rails.application.config.assets.precompile += %w( itembuy-slider.js )
Rails.application.config.assets.precompile += %w( exhibit.js )
Rails.application.config.assets.precompile += %w( mypage-change.js )
