require 'rails_helper'

RSpec.describe Board, type: :model do
  it '全てのフィールドが有効であること' do
    board = build(:board)
    expect(board).to be_valid
  end

  it 'タイトルが存在していない場合' do
    board = build(:board, title: nil)
    board.valid?
    expect(board.errors[:title]).to include('を入力してください')
  end

  it '本文が存在していない場合' do
    board = build(:board, body: nil)
    board.valid?
    expect(board.errors[:body]).to include('を入力してください')
  end

  it 'タイトルは255文字以下であること' do
    board = build(:board)
    board.title = 'a' * 255
    expect(board).to be_valid
  end

  it 'タイトルは256文字以上である場合' do
    board = build(:board)
    board.title = 'a' * 256
    board.valid?
    expect(board.errors[:title]).to include('は255文字以内で入力してください')
  end

  it '本文は65,535文字以下であること' do
    board = build(:board)
    board.body = 'a' * 65_535
    expect(board).to be_valid
  end

  it '本文は65,536文字以上である場合' do
    board = build(:board)
    board.body = 'a' * 65_536
    board.valid?
    expect(board.errors[:body]).to include('は65535文字以内で入力してください')
  end
end