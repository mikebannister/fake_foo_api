class FoosController < ApplicationController
  # GET /in_date_range?start_date=2010-04-14&end_date=2010-04-15
  # GET /in_date_range.json?start_date=2010-04-14&end_date=2010-04-15
  def in_date_range
    start_date = Chronic.parse(params[:start_date]).try(:to_date)
    end_date = Chronic.parse(params[:end_date]).try(:to_date)

    @foos = Foo.where(foo_date: start_date..end_date)
    render json: @foos
  end

  # GET /foos
  # GET /foos.json
  # GET /foos.json?start_date=2010-04-14&end_date=2010-04-15
  def index
    if params[:start_date] and params[:end_date]
      start_date = Chronic.parse(params[:start_date]).try(:to_date)
      end_date = Chronic.parse(params[:end_date]).try(:to_date)
      @foos = Foo.where(foo_date: start_date..end_date)
    else
      @foos = Foo.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @foos }
    end
  end

  # GET /foos/top_five
  # GET /foos/top_five.json
  def top_five
    order = params[:order].try(:downcase)
    ascending = order == 'asc'

    @foos = Foo.order(:foo_date).reverse_order.to_a.take(5)
    @foos.reverse! if ascending

    render json: @foos
  end

  # GET /foos/1
  # GET /foos/1.json
  def show
    @foo = Foo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @foo }
    end
  end

  # GET /foos/new
  # GET /foos/new.json
  def new
    @foo = Foo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @foo }
    end
  end

  # GET /foos/1/edit
  def edit
    @foo = Foo.find(params[:id])
  end

  # POST /foos
  # POST /foos.json
  def create
    params[:foo_date] = Chronic.parse(params[:foo_date])
    @foo = Foo.new(params[:foo])

    respond_to do |format|
      if @foo.save
        format.html { redirect_to @foo, notice: 'Foo was successfully created.' }
        format.json { render json: @foo, status: :created, location: @foo }
      else
        format.html { render action: "new" }
        format.json { render json: @foo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /foos/1
  # PUT /foos/1.json
  def update
    @foo = Foo.find(params[:id])

    respond_to do |format|
      if @foo.update_attributes(params[:foo])
        format.html { redirect_to @foo, notice: 'Foo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @foo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foos/1
  # DELETE /foos/1.json
  def destroy
    @foo = Foo.find(params[:id])
    @foo.destroy

    respond_to do |format|
      format.html { redirect_to foos_url }
      format.json { head :ok }
    end
  end
end
