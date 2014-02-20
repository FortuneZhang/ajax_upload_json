class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token



  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  def test_json
    p '-----test_json1------'

    p params

    params.each do |key, value|
      p key.to_s + '->' + value.to_s
      if key.to_s.eql? 'hobby'
        value.each do |item|
          p '     ' + item

        end
      end
    end

    render :text => 200
    
    
  end


  def test_json2
    p '-----test_json2------'
    p 'invoke'
    require 'json'

    p params


    (JSON.parse params['data']).each do |key, value|
      p key.to_s + '->' + value.to_s
      if key.to_s.eql? 'hobby'
        value.each do |item|
          p '     ' + item

        end
      end
    end

    render :text => 200


  end

  def test_json3


    require 'json'
    p '--------------------total params--------------------'
    p params
    p '--------------------end--------------------'

    p '--------------------begin each params[data]--------'
    (JSON.parse params['data']).each do |key, value|

      p key.to_s + '->' + value.to_s

      if key.to_s.eql? 'hobby'
        p '----------------hobby--------------------'
        p value
        value.each do |item|
          item.each do |k, v|
            p k.to_s + '->' + v.to_s
          end
        end
      end
    end

    render :text => 200


  end


  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render action: 'show', status: :created, location: @student }
      else
        format.html { render action: 'new' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :age)
    end
end
