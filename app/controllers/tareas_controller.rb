class TareasController < ApplicationController
  # GET /tareas
  def index
    @tareas = Tarea.all
    render json: @tareas
  end

  # GET /tareas/1
  def show
    @tarea = Tarea.find_by(id: params[:id])
    if @tarea
      render json: @tarea
    else
      render json: { error: 'Tarea no encontrada' }, status: :not_found
    end
  end

  # POST /tareas
  def create
    @tarea = Tarea.new(tarea_params)

    if @tarea.save
      render json: @tarea, status: :created
    else
      render json: @tarea.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tareas/1
  def update
    @tarea = Tarea.find_by(id: params[:id])
    if @tarea.update(tarea_params)
      render json: @tarea
    else
      render json: @tarea.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tareas/1
  def destroy
    @tarea = Tarea.find_by(id: params[:id])
    @tarea.destroy
  end

  private

  def set_tarea
    @tarea = Tarea.find(params[:id])
  end

  def tarea_params
    params.require(:tarea).permit(:titulo, :descripcion)
  end
end
