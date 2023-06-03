class InstructionsController < ApplicationController
  before_action :set_instruction, only: %i[edit update destroy]
  before_action :set_recipe, only: %i[index new create edit update destroy]

  def index
    @instructions = Instruction.all
  end

  def show; end

  def new
    @instruction = Instruction.new
  end

  def create
    if Instruction.new(instruction_params).save
      render turbo_stream: [
        turbo_stream.replace('instructions_list',
                             partial: 'instructions/index/instructions_list',
                             locals: { instructions: @recipe.instructions }),
        turbo_stream.replace('new_step',
                             partial: 'instructions/form',
                             locals: { instruction: Instruction.new })
      ]
    else
      flash[:danger] = 'Something wrong'
      redirect_back fallback_location: recipe_path(@instruction.recipe)
    end
  end

  def edit; end

  def update
    if @instruction.update(instruction_params)
      render turbo_stream: [
        turbo_stream.replace('instructions_list',
                             partial: 'instructions/index/instructions_list',
                             locals: { instructions: @recipe.instructions })
      ]
    else
      flash[:danger] = 'Something wrong'
      redirect_back fallback_location: recipe_path(@instruction.recipe)
    end
  end

  def destroy
    if @instruction.delete
      render turbo_stream: [
        turbo_stream.remove("instruction_#{@instruction.id}")
      ]
    else
      flash[:danger] = 'Something wrong'
      redirect_back fallback_location: recipe_path(@instruction.recipe)
    end
  end

  private

  def instruction_params
    params.require(:instruction).permit(Instruction::PARAMS)
  end

  def set_instruction
    @instruction = Instruction.find(params[:id])
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
