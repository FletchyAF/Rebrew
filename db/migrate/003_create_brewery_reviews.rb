class CreateBreweryReviews < ActiveRecord::Migration[6.1]
    def change
        create_table :brewery_reviews do |t|
            t.string :name
            t.string :review
            
            t.timestamps
        end
    end
end