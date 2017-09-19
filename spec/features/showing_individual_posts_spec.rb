require 'rails_helper.rb'

feature 'can view individual posts' do
    scenario 'can click and view a specific post' do

        # create a post with factory_girl
        post = create(:post)
        # visit '/'
        visit '/'
        # click on an image link
        find(:xpath, './/a[contains(@href,"posts/1")]').click
        # expect to be taken to the show page of our post
        expect(page.current_path).to eq(post_path(post))

    end
end
