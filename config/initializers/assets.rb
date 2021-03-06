# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( multiple_steps_form.js  )
Rails.application.config.assets.precompile += %w( favorite_button.js  )


# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.paths << Rails.root.join("lib", "assets", "stylesheets")
Rails.application.config.assets.paths << Rails.root.join("lib", "assets", "javascripts")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "javascripts")
Rails.application.config.assets.precompile += %w( application_for_admin.css)
Rails.application.config.assets.precompile += %w( application_for_admin.js )
Rails.application.config.assets.precompile += %w( signup.css )
Rails.application.config.assets.precompile += %w( main.js )
Rails.application.config.assets.precompile += %w( plugin.js )
Rails.application.config.assets.precompile += %w( favorite_button.js ) 
Rails.application.config.assets.precompile += ['directory/*']
