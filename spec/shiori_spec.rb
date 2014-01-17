# encoding: utf-8
require 'spec_helper'

describe '/' do
  context 'レコードが1件の場合' do
    before do
      Bookmark.create!(url: 'http://localhost/rspec_test')
    end

    it '登録したBookmarkのURLが出力されている' do
      visit '/'
      expect(page.status_code).to eq 200
      expect(page.find('//table/tbody/tr/td/a')['href']).to eq 'http://localhost/rspec_test'
    end
    it 'ページネイションが出力されない' do
      visit '/'
      expect(page).to_not have_selector '//div[@class="pagination"]'
    end
  end

  describe 'レコードが11件の場合' do
    before do
      11.times do |num|
        Bookmark.create!(url: "http://localhost/rspec_test_#{num})")
      end
    end

    it 'ページネイションが出力される' do
      visit '/'
      expect(page.status_code).to eq 200
      expect(page).to have_selector '//div[@class="pagination"]'
    end

    it '10件分出力される' do
      visit '/'
      expect(page.all('//table/tbody/tr/td/a').count).to eq 10
    end
  end

  describe '新規作成リンクを選択する' do
    it '新規作成ページへ遷移する' do
      visit '/'
      # 新規作成のリンクをクリックする
      page.find('//div.container/div/a').click 
      expect(page.current_path).to eq '/new'
    end
  end
end

describe '/new' do
  context 'URLに不備がある場合はエラー表示が行われる' do
    it '値を入力しない場合' do
      visit '/new'
      page.find('//form/button[@type=submit]').click
      expect(page.current_path).to eq '/create'
      expect(page).to have_selector('//div[@class="alert alert-danger"]')
    end
  end

  context 'URLを登録し、一覧画面へ遷移する' do
    it '値にURLを入力した場合' do
      visit '/new'
      within(:xpath, '//form/div') do
        fill_in 'url', with: 'http://localhost/input_test'
      end
      page.find('//form/button[@type=submit]').click
      expect(page.current_path).to eq '/'
      expect(page.find('//table/tbody/tr/td/a')['href']).to eq 'http://localhost/input_test'
    end
  end
end

