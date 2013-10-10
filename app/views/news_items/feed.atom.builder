
atom_feed :language => 'en-US' do |feed|
  #feed.title @title
  #feed.updated @updated

  #@news_items.each do |item|
    #next if item.updated_at.blank?

   # feed.entry( item ) do |entry|
    #  entry.url news_item_url(item)
   #   entry.title item.title
   #   entry.content item.content, :type => 'html'

   #   # the strftime is needed to work with Google Reader.
   #   entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 

    #  entry.author do |author|
    #    author.name entry.author_name
    #  end
   # end
#  end

     feed.title @title
    feed.updated(@updated) if @news_items.length > 0

    @news_items.each do |post|
      feed.entry(post) do |entry|
        entry.title(post.title)
        entry.content(post.content, type: 'html')
		
		# the strftime is needed to work with Google Reader.
        entry.updated(post.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 
        entry.author do |author|
          author.name(post.auther)
        end
      end
    end
	
end