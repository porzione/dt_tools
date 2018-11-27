#!/usr/bin/env ruby
# frozen_string_literal: true

require 'sequel'

DB_BASE_PATH = "#{ENV['DT_HOME'] || ENV['HOME']}/.config/darktable"
DB_LIB  = Sequel.connect "sqlite://#{DB_BASE_PATH}/library.db"
DB_DATA = Sequel.connect "sqlite://#{DB_BASE_PATH}/data.db"

CACHE = nil
Sequel::Model.plugin :caching, CACHE

class Image < Sequel::Model; end

class FilmRoll < Sequel::Model; end

class TaggedImage < Sequel::Model; end

class UsedTag < Sequel::Model; end

class MetaData < Sequel::Model(:meta_data)
# M_CREATOR   = 0
# M_PUBLISHER = 1
# M_TITLE     = 2
# M_DESCR     = 3
# M_RIGHTS    = 4
end

class Tag < Sequel::Model(DB_DATA); end

