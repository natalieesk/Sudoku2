class Grid

attr_accessor :cells
attr_accessor :puzzle

	def initialize puzzle 
		@puzzle = puzzle
		assign_values_from puzzle
		
	end

	def assign_values_from puzzle
		@cells = []
		i = 0
		while i < puzzle.to_s.length
			@cells << Cell.new(value = puzzle[i].to_i, position = i+1)
			i+=1
		end
		@cells
	end

	def candidates cell_selected
		cell_select = @cells[cell_selected]
		objects_array = @cells.select{|cell| cell.row == cell_select.row || cell.column == cell_select.column || cell.block == cell_select.block}
		candidates_array = objects_array.map{|cell| cell.value}
		return candidates_array
	end

	def find_candidates cell
		(1..9).to_a - (candidates(cell).select{|element| element != 0})
	end

	def solved?
		checked_array = @cells.select{|cell| cell.value == 0}
		return true if checked_array.count == 0
		false
		
	end

	def iterate
		i = 0
		while i < 81
			candidate = find_candidates(i)
			if @cells[i].solved? == true
				i +=1
			elsif find_candidates(i).count == 1
				@cells[i].value = candidate[0]
				i+=1
			else
				i+=1
			end
		end
		@cells
	end

	def solve
		outstanding_before, looping = @cells.count {|cell| cell.solved?}, false
		while !solved? && !looping
			iterate
			outstanding = @cells.count {|cell| cell.solved?}
			looping = outstanding_before == outstanding
			outstanding_before = outstanding
		end
		final_grid = @cells.map{|cell| cell.value}
		final_grid.join
	end

	# def print_to_screen
		
	# 	screen_grid = @cells.map{|cell| cell.value}.each_slice(9).to_a
	# 	array = screen_grid.each{|index| p screen_grid[index]}
	# 	array
		


	# end

	

end