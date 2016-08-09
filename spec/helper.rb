require 'bundler/setup'
Bundler.setup :default, :test

$LOAD_PATH.unshift __dir__ + '/..'
$LOAD_PATH.unshift __dir__

require 'support/minitest'
require 'awesome_print'
