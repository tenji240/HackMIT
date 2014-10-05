class SymptomsController < ApplicationController

  def new
    @symptom = Symptom.new
  end

  def edit
  end

  def create
    @symptom = Symptom.new(symp_params)
    respond to do |format|
      if @symptom.save
        format.html {redirect_to patients_url(params[:patient_id]) }
      else
        format.html { render :new }
        format.json { render json: @symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond to do |format|
      if @symptom.update(symp_params)
        format.html {redirect_to patients_url(params[:patient_id]) }
      else
        format.html { render :new }
        format.json { render json: @symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @symptom.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Symptom Removed' }
    end
  end

  private

  def set_symptom
    @symptom = @symptom.find(params[:id])
  end

  def symp_params
    param.require(:symptom).permit(:name, :patient_id)
  end
end
