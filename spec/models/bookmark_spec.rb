# encoding: utf-8
require 'spec_helper'

describe Bookmark do
  it 'URLの値が空の場合は例外が発生する' do
    expect {
      Bookmark.create!(url: '')
    }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'URLの値がnilの場合は例外が発生する' do
    expect {
      Bookmark.create!
    }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'URLの値がhttps等が存在しない場合は例外が発生する' do
    expect {
      Bookmark.create!(url: 'example.com')
    }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'URLの値がhttpから始まっている場合は保存できる' do
    expect {
      Bookmark.create!(url: 'http://example.com')
    }.to change{Bookmark.count}.from(0).to(1)
  end

  it 'URLの値がhttpsから始まっている場合は保存できる' do
    expect {
      Bookmark.create!(url: 'https://example.com')
    }.to change{Bookmark.count}.from(0).to(1)
  end
end
