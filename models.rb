#!/usr/bin/env ruby
# frozen_string_literal: true

require 'sequel'

DB_BASE_PATH = "#{ENV['DT_HOME'] || ENV['HOME']}/.config/darktable"
DB_LIB  = Sequel.connect "sqlite://#{DB_BASE_PATH}/library.db"
DB_DATA = Sequel.connect "sqlite://#{DB_BASE_PATH}/data.db"

CACHE = nil
Sequel::Model.plugin :caching, CACHE

## main lib
class Image < Sequel::Model
  GEO = %i[longitude latitude altitude].freeze
end

# id folder
class FilmRoll < Sequel::Model; end

# id name
class UsedTag < Sequel::Model; end

# imgid tagid
class TaggedImage < Sequel::Model; end

class MetaData < Sequel::Model(:meta_data)
  CREATOR   = 0
  PUBLISHER = 1
  TITLE     = 2
  DESCR     = 3
  RIGHTS    = 4

  NAMES = {
    CREATOR   => 'creator',
    PUBLISHER => 'publisher',
    TITLE     => 'title',
    DESCR     => 'description',
    RIGHTS    => 'rights'
  }.freeze
end

class Tag < Sequel::Model(DB_DATA); end
