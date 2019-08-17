# frozen_string_literal: true

# Rewrite "/" to "/index.html"
class IndexRewriter
  def initialize(app)
    @app = app
  end

  def call(env)
    env['PATH_INFO'].gsub!(%r{\/$}, '/index.html')
    @app.call(env)
  end
end

use IndexRewriter
run Rack::File.new('public')
