# encoding: utf-8
require 'active_record'
require 'will_paginate/active_record'

class Bookmark < ActiveRecord::Base
  validates :url, presence: true, format: { with: %r(\Ahttps?://.*\z) }

  self.per_page = 10
end
