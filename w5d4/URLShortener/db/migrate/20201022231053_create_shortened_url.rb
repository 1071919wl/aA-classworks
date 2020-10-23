class CreateShortenedUrl < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url,NULL:false
      t.string :short_url,NULL:false
      t.integer :submitter_id,NULL:false
      t.timestamps 
    end

  end
end
