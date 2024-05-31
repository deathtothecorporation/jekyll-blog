Jekyll::Hooks.register :posts, :post_write do |post|
  puts "Post '#{post.title}' was edited or created!"

  script_path = File.join(Jekyll.sites.first.source, 'put-to-cog.sh')
  puts "script #{script_path}"

  puts "Pushing new ui files to cog..."

  if system(script_path)
    puts "Cog was rehydrated!"
  else
    puts "Failed to rehydrate cog"
  end
end
