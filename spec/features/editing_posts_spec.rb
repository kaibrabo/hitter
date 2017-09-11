require 'rails_helper.rb'

feature 'editing posts' do

    background do
        # 'background' to perform actions that might be repeated over multiple tests prior to specific actions required for each scenario

        # create a post with factory_girl
        post = create(:post)
        # visit the root route
        visit root_path
        # click the image of the post we created with factory_girl
        find(:xpath, './/a[contains(@href,"posts/1")]').click
        # click the 'edit post' link
        click_link "Edit"
    end

    scenario 'can edit a specific post' do
        # fill in 'Caption' with "Oh god, you weren’t meant to see this picture!"
        fill_in 'Caption', with: "Yee"
        # click the ’Update Post’ button
        click_button "Update Post"
        # expect the page to have content saying "Post updated hombre."
        expect(page).to have_content("Post Updated!")
        # expect the page to have content saying “Oh god, you weren’t meant to see this picture!”
        expect(page).to have_content("Yee")
    end

    scenario "won't update a post w/o an image" do

        # fill in the 'Image' field with nothing
        attach_file('Image', 'spec/files/pele.zip')
        # click the 'Update Post' button
        click_button 'Update Post'
        # expect to see the message: 'Something is wrong with your form!'
        expect(page).to have_content("Post was not successfully updated, try again.")

    end
end
