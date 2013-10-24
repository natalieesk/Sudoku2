require 'cell'

describe Cell do

	
	let(:grid) {double :grid, (puzzle)}
	let(:cell) {Cell.new}

	context 'initialize' do
		it 'begins with 0 value' do
			expect(cell.value).to eq 0
		end
	end

	context 'object values with position 42' do
		let(:cell) {Cell.new(value = 3, position = 42)}

		it 'should have a value' do
			expect(cell.value).to eq 3
		end

		it 'has a position' do
			expect(cell.position).to eq 42
		end

		it 'knows it\'s row' do
			expect(cell.row).to eq 5
		end

		it 'knows it\'s column' do
			expect(cell.column).to eq 6
		end

		it 'knows it\'s block' do
			expect(cell.block).to eq 5
		end
	end	

	context 'object values with position 9' do
		let(:cell) {Cell.new(value = 3, position = 9)}

		it 'should have a value' do
			expect(cell.value).to eq 3
		end

		it 'has a position' do
			expect(cell.position).to eq 9
		end

		it 'knows it\'s row' do
			expect(cell.row).to eq 1
		end

		it 'knows it\'s column' do
			expect(cell.column).to eq 9
		end

		it 'knows it\'s block' do
			expect(cell.block).to eq 3
		end
	end	

	context 'solving' do
		

		it 'knows if it\'s solved' do
			cell = Cell.new(value = 7)
			expect(cell).to be_solved
		end

		it 'knows if it\'s not solved' do
			cell = Cell.new(value = 0)
			expect(cell).not_to be_solved
		end



	end

end