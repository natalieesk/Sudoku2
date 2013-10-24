require 'grid'

describe Grid do

let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600' }
let(:grid) {Grid.new(puzzle)}
let(:cell) {double :cell}


	it 'tells us that it has 81 cells' do
		expect(grid.cells.count).to eq 81

	end
	
	it 'should have an unsolved first cell' do
		expect(grid.cells[0]).not_to be_solved
	end

	it 'should have the value 1 for its second cell' do
		expect(grid.cells[1].value).to eq 1
	end

	it 'should have the position 80 for its last cell' do
		expect(grid.cells[80].position).to eq 81
	end

	it 'finds candidates' do
			expect(grid.candidates(31)).to eq [0, 0, 6, 4, 9, 0, 0, 0, 2, 0, 1, 7, 0, 4, 0, 9, 0, 5, 8, 7, 0] 
		end

	it 'removes 0 elements' do
		expect(grid.find_candidates(31)).to eq [3] 
	end

	it 'knows it is solved' do
		solved_grid = Grid.new('528756238756')
		expect(solved_grid.solved?).to be_true
	end

	it 'knows it is unsolved' do
		unsolved_grid = Grid.new('528750238756')
		expect(unsolved_grid.solved?).to be_false
	end

	it 'performs an iteration, turns value of first element to 6' do
		grid.iterate
		expect(grid.cells[0].value).to eq 6
	end

	it 'performs an iteration, turns value of 61st cell to 7' do
		grid.iterate
		expect(grid.cells[60].value).to eq 7
	end

	it "solves the puzzle" do
		# expect(grid.solved?).to be_false
		# grid.solve
		# expect(grid.solved?).to be_true
		expect(grid.solve).to eq ('615493872348127956279568431496832517521746389783915264952681743864379125137254698')
	end

	# it 'prints puzzle to screen' do
	# 	grid.solve
	# 	expect(grid.print_to_screen).to eq 
	# 	[6, 1, 5, 4, 9, 3, 8, 7, 2]
	# 	[3, 4, 8, 1, 2, 7, 9, 5, 6]
	# 	[2, 7, 9, 5, 6, 8, 4, 3, 1]
	# 	[4, 9, 6, 8, 3, 2, 5, 1, 7]
	# 	[5, 2, 1, 7, 4, 6, 3, 8, 9]
	# 	[7, 8, 3, 9, 1, 5, 2, 6, 4]
	# 	[9, 5, 2, 6, 8, 1, 7, 4, 3]
	# 	[8, 6, 4, 3, 7, 9, 1, 2, 5]
	# 	[1, 3, 7, 2, 5, 4, 6, 9, 8]
	# end




	

end