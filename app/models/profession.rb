class Profession < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '学生' },
    { id: 3, name: '会社員' },
    { id: 4, name: '学習者' },
    { id: 5, name: '主婦' },
    { id: 6, name: '主夫' },
    { id: 7, name: 'アルバイター' },
    { id: 8, name: '働いていない方' },
    { id: 9, name: 'その他' },
    { id: 10, name: '内緒' }
  ]

  include ActiveHash::Associations
  has_many :user

end