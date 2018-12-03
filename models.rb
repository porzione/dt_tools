#!/usr/bin/env ruby
# frozen_string_literal: true

SEQUEL_NO_ASSOCIATIONS = true

require 'sequel'

DB_BASE_PATH = "#{ENV['DT_HOME'] || ENV['HOME']}/.config/darktable"
DB = Sequel.connect("sqlite://#{DB_BASE_PATH}/library.db").freeze
DB_DATA = Sequel.connect("sqlite://#{DB_BASE_PATH}/data.db").freeze

module DT
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

  GEO = %i[longitude latitude altitude].freeze
end

class Image < Sequel::Model; end

class FilmRoll < Sequel::Model; end

class UsedTag < Sequel::Model; end

class TaggedImage < Sequel::Model; end

class MetaData < Sequel::Model(:meta_data); end

class Tag < Sequel::Model(DB_DATA); end
