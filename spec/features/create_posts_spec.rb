require 'rails_helper.rb'

describe 'creating posts' do
    it 'can create a post' do

        visit '/'
        click_link 'New Post'
        attach_file('Image', "spec/files/images/profile.jpg")
        fill_in 'Caption', with: 'Out with Pele! #frenchie'
        click_button 'Create Post'
        expect(page).to have_content('#frenchie')
        expect(page).to have_css("img[src*='profile.jpg']")

    end

    it 'needs an image to create a post' do

        #visit root route
        visit '/'
        #click the 'New Post' button
        click_link 'New Post'
        #fill in the caption field (w/o touching the image field)
        fill_in 'Caption', with: "Yee"
        #click the create post button
        click_button 'Create Post'
        #expect the page to raise an error
        expect(page).to have_content('Post was not successful, try agin')

    end
end
