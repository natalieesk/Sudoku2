class Cell

	attr_accessor :value
	attr_accessor :position
	attr_accessor :row
	attr_accessor :column
	attr_accessor :block

	def initialize value = 0, position = 0
		@value = value
		@position = position
		@row = find_row_at position
		@column = find_column_at position
		@block = find_block_at position
		@solved
	end

	def find_row_at position
		return position /9 if position % 9 == 0
		position / 9 + 1
	end

	def find_column_at position
		return 9 if position % 9 == 0
		position % 9
	end

	def find_block_at position
		((@row -1) /3) *3 + ((@column -1) /3) + 1
	end

	def solved?
		@value != 0

	end



	def candidates



	end

end