class CreateBreweryReviews < ActiveRecord::Migration[6.1]
    def change
        create_table :brewery_reviews do |t|
            t.string :title
            t.string :content
            t.integer :user_id
            t.integer :brewery_id
            t.timestamps
        end
    end
end