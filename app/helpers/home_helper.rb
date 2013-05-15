module HomeHelper
	def get_tags
		tags = Article.all.map{|e| e.tag_array}.inject([]){|s,e| s+=e;s}
		tags.inject(Hash.new(0)){|h,e| h[e]+= 1; h}.sort_by {|k,v| v}.reverse
	end

	def render_tag_link(pair,index)
		return if index > 20
		font_size = 18-index 
		font_size = 12 if font_size < 12
		content_tag :span,:style=>"font-size:#{font_size}px" do 
			link_to pair[0], tag_path(pair[0])
		end
	end
end
