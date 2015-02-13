class SpiralMatrixSolver
  attr_reader :matrix, :current_x, :current_y, :current_digit, :step

  def initialize(size)
    @matrix = Array.new(size) { Array.new(size) { 0 } }
    fill_middle_cell
  end

  def fill_middle_cell
    @current_x, @current_y = matrix_middle, matrix_middle
    @current_digit = starting_digit
    @step = 1

    fill_cell
  end

  def fill
    move_right = true
    loop do
      # last row(special case)
      if step == matrix_size
        if move_right
          step.times { @current_x += 1; fill_cell }
        else
          step.times { @current_x -= 1; fill_cell }
        end
        break
      end

      if move_right
        # right, then bottom
        step.times { @current_x += 1; fill_cell }
        step.times { @current_y += 1; fill_cell }
        move_right = false
      else
        # left, then top
        step.times { @current_x -= 1; fill_cell }
        step.times { @current_y -= 1; fill_cell }
        move_right = true
      end
      @step += 1
    end
  end

  def output_diagonal_sum
    sum = 0
    (0..(matrix_size - 1)).each do |i|
      (0..(matrix_size - 1)).each do |j|
        if i == j || i + j == matrix_size - 1
          sum += matrix[i][j]
        end
      end
    end
    puts sum
  end

  def output
    (0..(matrix_size - 1)).each do |i|
      (0..(matrix_size - 1)).each do |j|
        print matrix[i][j].to_s.ljust(3)
      end
      puts
    end
  end

  private

  def fill_cell
    @matrix[current_y][current_x] = current_digit
    @current_digit += 1
  end

  def matrix_middle
    @matrix_middle ||= (matrix.size - 1) / 2
  end

  def starting_digit
    @starting_digit ||= 1
  end

  def matrix_size
    @matrix_size ||= matrix.size
  end
end

a = SpiralMatrixSolver.new(1001)
a.fill
# a.output
a.output_diagonal_sum
