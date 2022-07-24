require 'rails_helper'

RSpec.describe User, type: :system, js: true do
  describe 'User CRUD' do
    describe '新規登録' do
      context '正常系' do
        it 'ユーザーの新規登録成功 & 詳細画面へリダイレクト' do
          visit new_user_path
          
          find('[data-test="user_email"]').set('test@example.com')
          find('[data-test="submit"]').click

          expect(page).to have_current_path user_path(id: User.last.id)
          expect(page).to have_content 'test@example.com'
        end
      end

      context '異常系' do
        it '重複するメールアドレス' do
          create(:user, email: 'duplication@example.com')

          visit new_user_path
          
          find('[data-test="user_email"]').set('duplication@example.com')
          find('[data-test="submit"]').click

          expect(page).not_to have_current_path user_path(id: User.last.id)
          expect(page).to have_content validation_error('user', 'email', 'taken')
        end
      end
    end
  end
end
