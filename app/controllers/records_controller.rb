class RecordsController < ApplicationController
  # GET /records
  # GET /records.json
  def index
    @records = Record.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @records }
    end
  end

  # GET /records/1
  # GET /records/1.json
  def show
    @record = Record.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @record }
    end
  end

  # GET /records/new
  # GET /records/new.json
  def new
    @record = Record.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @record }
    end
  end

  # GET /records/1/edit
  def edit
    @record = Record.find(params[:id])
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(params[:record])

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
        format.json { render nothing: true }
      else
        format.html { render action: "new" }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /records/1
  # PUT /records/1.json
  def update
    @record = Record.find(params[:id])

    respond_to do |format|
      if @record.update_attributes(params[:record])
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record = Record.find(params[:id])
    @record.destroy

    respond_to do |format|
      format.html { redirect_to records_url }
      format.json { head :no_content }
    end
  end
  
  # POST /records/update_globe
  def update_globe
    data = Hash.new
    Record.find_each do |record|
      point_step = data[[record.latitude, record.longitude]] || [0, 0]
      data[[record.latitude, record.longitude]] = [point_step.first + record.point, point_step.last + record.step]
    end
    
    point_arr = step_arr = []
    max_point = max_step = 1.0
    data.each do |k, v|
      max_point = v.first.to_f if max_point < v.first
      max_step = v.last.to_f if max_step < v.last
    end
    
    data.each do |k, v|
      point_arr += k + [ (v.first / max_point).round(3) ]
      step_arr += k + [ (v.last / max_step).round(3) ]
    end
    result = [["point", point_arr], ["step", step_arr]]
    
    File.open("#{Rails.root}/public/globe/data.json", "wb") { |file| file.write result.to_json }
    render json: {message: "Done"}
  end
end
