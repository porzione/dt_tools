#!/usr/bin/env ruby
# frozen_string_literal: true

require 'sequel'

DB_BASE_PATH = "#{ENV['DT_HOME'] || ENV['HOME']}/.config/darktable"
DB_LIB  = Sequel.connect "sqlite://#{DB_BASE_PATH}/library.db"
DB_DATA = Sequel.connect "sqlite://#{DB_BASE_PATH}/data.db"

CACHE = nil
Sequel::Model.plugin :caching, CACHE

class Image < Sequel::Model
  GEO = %i[longitude latitude altitude].freeze
end

class FilmRoll < Sequel::Model; end

class TaggedImage < Sequel::Model; end

class UsedTag < Sequel::Model; end

class MetaData < Sequel::Model(:meta_data)
  CREATOR   = 0
  PUBLISHER = 1
  TITLE     = 2
  DESCR     = 3
  RIGHTS    = 4
end

class Tag < Sequel::Model(DB_DATA); end
