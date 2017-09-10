require 'rails_helper.rb'

describe 'index posts' do
    it 'will display correct post information' do
        # Create multiple posts using factories
        post_one = create(:post, caption: "This is post one")
        post_two = create(:post, caption: "This is the second post")
        # User visits the root route
        visit '/'
        # User can see the comments and images of the posts we've created
        expect(page).to have_content('This is post one')
        expect(page).to have_content('This is the second post')
        expect(page).to have_css("img[src*='profile']")
    end
end
