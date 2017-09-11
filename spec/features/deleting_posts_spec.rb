require 'rails_helper.rb'

feature 'deleting posts' do

    background do
        # create an example post using factory_girl
        post = create(:post, caption: "Pele")
        # visit the root route
        visit root_path
        # click on the image to 'show' the individual post
        find(:xpath, ".//a[contains(@href, 'posts/1')]").click
        # click on the 'Edit Post' button to enter the edit view
        click_link "Edit"
    end

    scenario 'can delete a single post' do
        # click on the 'Delete Post' button
        click_link 'Delete'
        # expect to be routed to the root again.
        # expect to see the message "Problem solved!  Post deleted."
        expect(page).to have_content("Post Deleted!")
        # expect to not see the old post anymore.
        expect(page).to_not have_content("Pele")
    end
end
