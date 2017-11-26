# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions
activate :livereload
activate :sprockets




activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :blog do |blog|
  blog.prefix = "blog"
end


import_path File.expand_path('bower_components', app.root)

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
# set article_layout file for blogging
page "blog/*", :layout => :article_layout

# github project pages deploy
activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.build_before = true # default: false
end


configure :build do
	set :relative_links, true
	activate :minify_css
	activate :minify_javascript
	activate :asset_hash
	# Relative assets needed to deploy to Github Pages
	activate :relative_assets
	# Name of the project where you working on
	set :site_url, "/quique_blog"
end




