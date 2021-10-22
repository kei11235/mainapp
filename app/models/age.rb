class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '~10代' },
    { id: 3, name: '10代' },
    { id: 4, name: '20代' },
    { id: 5, name: '30代' },
    { id: 6, name: '40代' },
    { id: 7, name: '50代' },
    { id: 8, name: '60代~' },
    { id: 9, name: 'その他' },
    { id: 10, name: '内緒' }
  ]

  include ActiveHash::Associations
  has_many :user

end