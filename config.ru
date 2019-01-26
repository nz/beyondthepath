# frozen_string_literal: true

require 'bundler/setup'
require 'rack/contrib/try_static'

use Rack::TryStatic, root: 'public', urls: [''],
                     try: ['.html', 'index.html', '/index.html']

app = proc do |env|
  ['400', { 'Content-Type' => 'text/html' }, [%(<pre>#{env.inspect}</pre>)]]
end

run app
